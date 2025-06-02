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
            let allergies = Allergies({{subCases.input.score}})
        {%- if subCases.property == "allergicTo" %}
            {%- if subCases.expected %}
                #expect(allergies.{{subCases.property}}(item: "{{subCases.input.item}}"))
            {%- else %}
                #expect(!allergies.{{subCases.property}}(item: "{{subCases.input.item}}"))
            {%- endif %}
        {%- else %}
            {%- if subCases.expected %}
                #expect(allergies.{{subCases.property}}() == {{subCases.expected | toStringArray }})
            {%- endif %}
        {%- endif %}
        }
        {% endfor -%}
    {% endfor -%}
}
