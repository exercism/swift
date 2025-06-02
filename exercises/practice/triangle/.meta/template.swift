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
        {%- if subCases.expected %}
            #expect(Triangle({{subCases.input.sides}}).is{{subCases.property | capitalize }})
        {%- else %}
            #expect(!Triangle({{subCases.input.sides}}).is{{subCases.property | capitalize }})
        {%- endif %}
        }
        {% endfor -%}
    {% endfor -%}
}
