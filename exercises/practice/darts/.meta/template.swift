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
        #expect(dartScore(x: {{case.input.x | round:1 }}, y: {{case.input.y | round:1}}) == {{case.expected}})
    }
    {% endfor -%}
}
