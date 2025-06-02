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
            func test{{subCases.property |camelCase}}{{subCases.description |camelCase }}() {
        {%- if subCases.property == "encode" %}
            #expect(RunLengthEncoding.encode("{{subCases.input.string}}") == "{{subCases.expected}}")
        {%- elif subCases.property == "consistency" %}
            let encoded = RunLengthEncoding.encode("{{subCases.input.string}}")
            let decoded = RunLengthEncoding.decode(encoded)
            #expect(decoded == "{{subCases.expected}}")
        {%- else %}
            #expect(RunLengthEncoding.decode("{{subCases.input.string}}") == "{{subCases.expected}}")
        {%- endif %}
        }
        {% endfor -%}
    {% endfor -%}
}
