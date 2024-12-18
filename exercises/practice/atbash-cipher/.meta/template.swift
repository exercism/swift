import Testing
import Foundation
@testable import {{exercise|camelCase}}

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct {{exercise|camelCase}}Tests {
    {% for case in cases %}
        {%- for subCases in case.cases %}

        {% if forloop.first -%}
            @Test("{{subCases.description}}")
        {% else -%}
            @Test("{{subCases.description}}", .enabled(if: RUNALL))
        {% endif -%}
            func test{{subCases.description |camelCase }}() {
            {%- if subCases.property == "encode" -%}
            #expect("{{subCases.expected}}" == AtbashCipher.encode("{{subCases.input.phrase}}"))
            {%- else -%}
            #expect("{{subCases.expected}}" == AtbashCipher.decode("{{subCases.input.phrase}}"))
            {%- endif %}
        }
        {%- endfor %}
    {% endfor -%}
}
