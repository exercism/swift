import Testing
import Foundation
@testable import {{exercise | camelCase}}

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct {{exercise | camelCase}}Tests {
    {% outer: for case in cases %}
        {% for subCase in case.cases %}
        {% if forloop.outer.first and forloop.first %}
            @Test("{{subCase.description}}")
        {% else -%}
            @Test("{{subCase.description}}", .enabled(if: RUNALL))
        {% endif -%}
            func test{{subCase.description | camelCase}}() {
                #expect({{subCase.property}}("{{subCase.input.msg}}", rails: {{subCase.input.rails}}) == "{{subCase.expected}}")
            }
        {% endfor %}
    {% endfor %}
}
