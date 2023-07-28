import XCTest
@testable import {{exercise|camelCase}}
class {{exercise|camelCase}}Tests: XCTestCase {
    let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

    {% for case in cases %}
        {%- if forloop.first %}
            func test{{case.description |camelCase }}() {
        {%- else %}
            func test{{case.description |camelCase }}() throws {
            try XCTSkipIf(true && !runAll) // change true to false to run this test
        {%- endif %}
            let bowling = Bowling({{case.input.previousRolls}})
            {% if case.property == "score" -%}
            {% if case.expected.error -%}
                XCTAssertThrowsError(try bowling.{{case.property}}()) { error in
                    {% if case.expected.error == "Score cannot be taken until the end of the game" -%}
                    XCTAssertEqual(error as? BowlingError, BowlingError.gameInProgress)
                    {% else -%}
                        XCTAssertEqual(error as? BowlingError, BowlingError.tooManyPinsInFrame)
                    {% endif -%}
                }
            {% else -%}
               XCTAssertEqual(try! bowling.{{case.property}}(), {{case.expected}})
            {% endif -%}
            {% else -%}
            {% if case.expected.error -%}
            XCTAssertThrowsError(try bowling.{{case.property}}(pins: {{case.input.roll}})) { error in
                {%- if case.expected.error == "Negative roll is invalid" %}
                    XCTAssertEqual(error as? BowlingError, BowlingError.negativePins)
                {%- elif case.expected.error == "Pin count exceeds pins on the lane" %}
                    XCTAssertEqual(error as? BowlingError, BowlingError.tooManyPinsInFrame)
                {%- else %}
                    XCTAssertEqual(error as? BowlingError, BowlingError.gameIsOver)
                {%- endif %}
            }
            {% else -%}
                XCTAssertEqual(try! bowling.{{case.property}}(pins: {{case.input.roll}}), {{case.expected}})
            {% endif -%}
            {% endif -%}
        }
    {% endfor -%}
}
