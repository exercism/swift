import Foundation
import Testing

@testable import {{exercise|camelCase}}

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct {{exercise|camelCase}}Tests {
    {% for case in cases %}
        {%- if forloop.first %}
            @Test("{{case.description}}")
        {%- else %}
            @Test("{{case.description}}", .enabled(if: RUNALL))
        {%- endif %}
            func test{{case.description |camelCase }}() {
            let bowling = Bowling({{case.input.previousRolls}})
            {% if case.property == "score" -%}
            {% if case.expected.error -%}
                #expect(throws:
                    {% if case.expected.error == "Score cannot be taken until the end of the game" -%}
                    BowlingError.gameInProgress
                    {% else -%}
                        BowlingError.tooManyPinsInFrame
                    {% endif -%}
                    ) {try bowling.{{case.property}}()}
            {% else -%}
               #expect(try! bowling.{{case.property}}() == {{case.expected}})
            {% endif -%}
            {% else -%}
            {% if case.expected.error -%}
            #expect(throws: 
                {%- if case.expected.error == "Negative roll is invalid" %}
                    BowlingError.negativePins
                {%- elif case.expected.error == "Pin count exceeds pins on the lane" %}
                    BowlingError.tooManyPinsInFrame
                {%- else %}
                    BowlingError.gameIsOver
                {%- endif %}
                ) {try bowling.{{case.property}}(pins: {{case.input.roll}})}
            
            {% else -%}
                #expect(try! bowling.{{case.property}}(pins: {{case.input.roll}}) == {{case.expected}})
            {% endif -%}
            {% endif -%}
        }
    {% endfor -%}
}
