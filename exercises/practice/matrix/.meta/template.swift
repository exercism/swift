import Testing
import Foundation
@testable import {{exercise|camelCase}}

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct {{exercise|camelCase}}Tests {
    {% for case in cases %}
    {% if forloop.first -%}
        @Test("{{case.description}}")
    {% else -%}
        @Test("{{case.description}}", .enabled(if: RUNALL))
    {% endif -%}
    func test{{case.description |camelCase }}() {
        let matrix = Matrix("{{case.input.string | inspect}}")
        {% if case.property == "row" -%}
        #expect({{case.expected}} == matrix.rows[{{case.input.index | minus: 1}}])
        {% else -%}
        #expect({{case.expected}} == matrix.columns[{{case.input.index | minus: 1}}])
        {% endif -%}
    }
    {% endfor -%}
}
