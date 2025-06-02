import Testing
import Foundation
@testable import {{exercise|camelCase}}

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct {{exercise|camelCase}}Tests {
    {% outer: for case in cases %}
        {%- for subCases in case.cases %}
        {%- if subCases.cases %}
        {%- for subSubCases in subCases.cases %}
            @Test("{{subSubCases.description}}", .enabled(if: RUNALL))
            func test{{subSubCases.description |camelCase }}() {
            let garden = Garden("{{subSubCases.input.diagram | inspect}}")
            #expect(garden.plantsForChild("{{subSubCases.input.student}}") == {{subSubCases.expected | toEnumArray}})
        }
        {% endfor -%}
        {%- else %}
        {%- if forloop.outer.first and forloop.first %}
            @Test("{{subCases.description}}")
        {%- else %}
            @Test("{{subCases.description}}", .enabled(if: RUNALL))
        {%- endif %}
            func test{{subCases.description |camelCase }}() {
            let garden = Garden("{{subCases.input.diagram | inspect}}")
            #expect(garden.plantsForChild("{{subCases.input.student}}") == {{subCases.expected | toEnumArray}})
        }
        {%- endif %}
        {% endfor -%}
    {% endfor -%}
}
