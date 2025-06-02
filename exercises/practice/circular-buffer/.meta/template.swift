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
        var buffer = CircularBuffer(capacity: {{ case.input.capacity }})
        {% for operation in case.input.operations %}
        {%- if operation.operation == "read" %}
            {%- ifnot operation.should_succeed %}
            #expect(throws: CircularBufferError.bufferEmpty) {try buffer.read()}
            {%- else %}
            #expect(try! buffer.read() == {{ operation.expected }})
            {%- endif %}
        {%- elif operation.operation == "write" %}
            {%- ifnot operation.should_succeed %}
            #expect(throws: CircularBufferError.bufferFull) {try buffer.write({{ operation.item }})}
            {%- else %}
            try! buffer.write({{ operation.item }})
            {%- endif %}
        {%- elif operation.operation == "clear" %}
            buffer.clear()
        {%- elif operation.operation == "overwrite" %}
            buffer.overwrite({{ operation.item }})
        {%- endif %}
        {%- endfor %}
    }
    {% endfor -%}
}