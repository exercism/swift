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
        {%- if case.property == "largest" and case.expected.error -%}
            #expect(throws: PalindromeError.invalidRange) {
                try PalindromeProducts.largest(from: {{case.input.min}}, to: {{case.input.max}})
            }
        {%- elif case.expected.error -%}
            #expect(throws: PalindromeError.invalidRange) {
                try PalindromeProducts.smallest(from: {{case.input.min}}, to: {{case.input.max}})
            }
        {%- elif case.property == "largest" -%}
            let largest = try! PalindromeProducts.largest(from: {{case.input.min}}, to: {{case.input.max}})
            {%- ifnot case.expected.value | isNull %}
            #expect(largest.value == {{case.expected.value}})
            {%- else %}
            #expect(largest.value == nil)
            {%- endif %}
            {%- if case.expected.factors.count == 0 %}
            #expect(largest.factors == Set())
            {% else %}
            #expect(largest.factors == Set(arrayLiteral: {% for value in case.expected.factors %}{% ifnot forloop.first %}, {%- endif %}{{value}}{% endfor %}))
            {%- endif %}
        {%- else -%}
            let smallest = try! PalindromeProducts.smallest(from: {{case.input.min}}, to: {{case.input.max}})
            {%- ifnot case.expected.value | isNull %}
            #expect(smallest.value == {{case.expected.value}})
            {%- else %}
            #expect(smallest.value == nil)
            {%- endif %}
            {%- if case.expected.factors.count == 0 %}
            #expect(smallest.factors == Set())
            {% else %}
            #expect(smallest.factors == Set(arrayLiteral: {% for value in case.expected.factors %}{% ifnot forloop.first %}, {%- endif %}{{value}}{% endfor %}))
            {%- endif %}
        {% endif -%}
    }
    {% endfor -%}
}
