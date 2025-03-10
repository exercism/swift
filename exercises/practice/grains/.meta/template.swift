import Testing
import Foundation
@testable import {{exercise|camelCase}}

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct {{exercise|camelCase}}Tests {
    {% outer: for case in cases %}
        {% ifnot case.expected %}
            {%- for subCases in case.cases %}
            {%- if forloop.outer.first and forloop.first %}
                @Test("{{subCases.description}}")
            {%- else %}
                @Test("{{subCases.description}}", .enabled(if: RUNALL))
            {%- endif %}
                func test{{subCases.description |camelCase }}() {
            {%- ifnot subCases.expected.error %}
            #expect(try! Grains.square({{subCases.input.square}}) == {{subCases.expected}})
            {%- else %}
            #expect(throws:
                {%- if subCases.input.square < 1 %}
                GrainsError.inputTooLow
                {%- elif subCases.input.square > 64 %}
                GrainsError.inputTooHigh
                {%- endif %}
                ){try Grains.square({{subCases.input.square}})}
            {%- endif -%}

        }
        {% endfor -%}
        {%- else %}
        @Test("{{subCases.description}}", .enabled(if: RUNALL))
        func test{{subCases.description |camelCase }}{{ forloop.outer.counter }}() {
        #expect(try! Grains.total == {{case.expected}})
        }
        {%- endif %}
    {% endfor -%}
}
