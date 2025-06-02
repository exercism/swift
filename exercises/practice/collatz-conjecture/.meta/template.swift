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
        {%- ifnot case.expected.error -%}
            #expect(try! CollatzConjecture.steps({{case.input.number}}) == {{case.expected}})
        {%- else %}
            #expect(throws: (any Error).self){try CollatzConjecture.steps({{case.input.number}})}
        {%- endif -%}
    }
    {% endfor -%}
}
