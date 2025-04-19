import Testing
import Foundation
@testable import {{exercise|camelCase}}

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct {{exercise|camelCase}}Tests {
    {% outer: for case in cases %}
        {%- for subCases in case.cases %}
        {%- if forloop.outer.first and forloop.first %}
            @Test("{{subCases.description}}")
        {%- else %}
            @Test("{{subCases.description}}", .enabled(if: RUNALL))
        {%- endif %}
            func test{{subCases.description |camelCase }}{{ forloop.outer.counter }}() {
            var robot = SimulatedRobot(x: {{subCases.input.position.x}}, y: {{subCases.input.position.y}}, bearing: .{{subCases.input.direction}})
            robot.move(commands: "{{subCases.input.instructions}}")
            let state = robot.state
            #expect(state.x == {{subCases.expected.position.x}} && state.y == {{subCases.expected.position.y}} && state.bearing == .{{subCases.expected.direction}})
        }
        {% endfor -%}
    {% endfor -%}
}
