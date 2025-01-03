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
            func test{{subCases.description |camelCase }}() {
        let scaleGenerator = ScaleGenerator(tonic: "{{subCases.input.tonic}}")
        {%- if subCases.property == "chromatic" %}
            #expect(scaleGenerator.{{subCases.property}}() == {{subCases.expected | toStringArray }})
        {%- else %}
            #expect(scaleGenerator.{{subCases.property}}("{{subCases.input.intervals}}") == {{subCases.expected | toStringArray }})
        {%- endif %}
        }
        {% endfor -%}
    {% endfor -%}
}
