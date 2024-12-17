import Testing
import Foundation
@testable import {{exercise|camelCase}}

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

{% for case in cases %}
{% if forloop.first -%}
    @Test("{{case.description}}")
    func test{{case.description |camelCase }}() {
{% else -%}
    @Test("{{case.description}}", .enabled(if: RUNALL))
    func test{{case.description |camelCase }}() throws {
{% endif -%}
    {%- if case.expected -%}
    #expect(isArmstrongNumber({{case.input.number}}))
    {%- else -%}
    #expect(isArmstrongNumber({{case.input.number}}))
    {%- endif %}
}
{% endfor -%}

