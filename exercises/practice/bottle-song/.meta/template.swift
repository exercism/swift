import Testing
import Foundation
@testable import {{exercise|camelCase}}

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct {{exercise|camelCase}}Tests {
    {% outerOuter: for case in cases %}
        {%- outer: for subCases in case.cases %}
            {%- if subCases.cases %}
            {%- for subSubCases in subCases.cases %}
            {%- if forloop.outerOuter.first and forloop.outer.first and forloop.first %}
            @Test("{{subSubCases.description}}")
        {%- else %}
            @Test("{{subSubCases.description}}", .enabled(if: RUNALL))
        {%- endif %}
            func test{{subSubCases.description |camelCase }}{{ forloop.outer.counter }}() {
                let bottleSong = BottleSong(bottles: {{subSubCases.input.startBottles}})
                let expected = {{subSubCases.expected | toStringArray }}
                #expect(bottleSong.song(takedown: {{subSubCases.input.takeDown}}) == expected)
            }
            {% endfor -%}
            {%- else %}
            {%- if forloop.outerOuter.first and forloop.outer.first  %}
                @Test("{{subCases.description}}")
            {%- else %}
                @Test("{{subCases.description}}", .enabled(if: RUNALL))
            {%- endif %}
                func test{{subCases.description |camelCase }}{{ forloop.outer.counter }}() {
                let bottleSong = BottleSong(bottles: {{subCases.input.startBottles}})
                let expected = {{subCases.expected | toStringArray }}
                #expect(bottleSong.song(takedown: {{subCases.input.takeDown}}) == expected)
            }
            {%- endif %} 
        {% endfor -%}
    {% endfor -%}
}
