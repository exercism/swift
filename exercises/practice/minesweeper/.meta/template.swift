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
        {% ifnot case.input.minefield -%}
        let input = [String]()
        let output = [String]()
        {% else -%}
        let input = {{case.input.minefield | toStringArray}}
        let output = {{case.expected | toStringArray}}
        {% endif -%}
        #expect(Board(input).transform() == output)
    }
    {% endfor -%}
}
