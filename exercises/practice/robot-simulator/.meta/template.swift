import XCTest
@testable import {{exercise|camelCase}}
class {{exercise|camelCase}}Tests: XCTestCase {
    let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

    {% outer: for case in cases %}
        {%- for subCases in case.cases %}
        {%- if forloop.outer.first and forloop.first %}
            func test{{subCases.description |camelCase }}{{ forloop.outer.counter }}() {
        {%- else %}
            func test{{subCases.description |camelCase }}{{ forloop.outer.counter }}() throws {
            try XCTSkipIf(true && !runAll) // change true to false to run this test
        {%- endif %}
            var robot = SimulatedRobot(x: {{subCases.input.position.x}}, y: {{subCases.input.position.y}}, bearing: .{{subCases.input.direction}})
            robot.move(commands: "{{subCases.input.instructions}}")
            let state = robot.state
            XCTAssertTrue(state.x == {{subCases.expected.position.x}} && state.y == {{subCases.expected.position.y}} && state.bearing == .{{subCases.expected.direction}})
        }
        {% endfor -%}
    {% endfor -%}
}
