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
        let deque = Deque<Int>()
        {%- for operation in case.input.operations -%}
            {%- if operation.operation == "count" -%}
                #expect(deque.{{operation.operation}} == {{operation.expected}})
            {%- elif operation.expected -%}
                #expect(deque.{{operation.operation}}() == {{operation.expected}})
            {%- else -%}
                deque.{{operation.operation}}({{operation.value}})
            {%- endif -%}
        {%- endfor -%}
    }
{% endfor -%}
}