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
        {%- if case.expected -%}
        #expect(isIsogram("{{case.input.phrase}}"))
        {%- else -%}
        #expect(!isIsogram("{{case.input.phrase}}"))
        {%- endif %}
    }
    {% endfor -%}
}
