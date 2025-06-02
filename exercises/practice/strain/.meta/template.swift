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
        {%- if case.input.list.count == 0 -%}
        let input : [Int] = []  
        {%- else -%}
        let input = {{case.input.list | toStringArray}} 
        {%- endif %}
        {%- if case.expected.count == 0 %}
        let expected : [Int] = []  
        {%- else %}
        let expected = {{case.expected | toStringArray}}  
        {%- endif %}
        #expect(input.{{case.property}} {{case.input.predicate | strain}} == expected)
    }
    {% endfor -%}
}
