import Testing
import Foundation
@testable import {{exercise | camelCase}}

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct {{exercise | camelCase}}Tests {
    {% for case in cases %}
    {% if not case.cases %}
        {% if forloop.first %}
            @Test("{{case.description}}")
        {% else %}
            @Test("{{case.description}}", .enabled(if: RUNALL))
        {% endif -%}
        func test{{case.description | camelCase}}() {
            #expect(HighScores(scores: {{case.input.scores}}).{{case.property}} == {{case.expected}})
        }
    {%- elif case.cases %}
        {% for subCase in case.cases %}
            @Test("{{subCase.description}}", .enabled(if: RUNALL))
            func test{{subCase.description | camelCase}}() {
                var hs = HighScores(scores: {{subCase.input.scores}})
                {%- if subCase.property == "latestAfterTopThree" or subCase.property == "scoresAfterTopThree"  %}
                    hs.topThree
                {% elif subCase.property == "latestAfterBest" or subCase.property == "scoresAfterBest" %}
                    hs.personalBest  
                {% endif -%}
                #expect(hs.
                {%- if subCase.property == "personalTopThree" -%}
                    topThree
                {%- elif subCase.property == "latestAfterTopThree" or subCase.property == "latestAfterBest" -%}
                    latest
                {%- elif subCase.property == "scoresAfterTopThree" or subCase.property == "scoresAfterBest" -%}
                    scores
                {%- endif %} == {{subCase.expected}})
            }
        {% endfor -%}
    {%- endif %}
    {% endfor -%}
}
