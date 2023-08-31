import XCTest
@testable import {{exercise|camelCase}}
class {{exercise|camelCase}}Tests: XCTestCase {
    let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

    {% for case in cases %}
    {% if forloop.first -%}
        func test{{case.description |camelCase }}() {
    {% else -%}
        func test{{case.description |camelCase }}() throws {
        try XCTSkipIf(true && !runAll) // change true to false to run this test
    {% endif -%}
        var buffer = CircularBuffer(capacity: {{ case.input.capacity }})
        {% for operation in case.input.operations %}
        {%- if operation.operation == "read" %}
            {%- ifnot operation.should_succeed %}
            XCTAssertThrowsError(try buffer.read()) { error in
                XCTAssertEqual(error as? CircularBufferError, .bufferEmpty)
            }
            {%- else %}
            XCTAssertEqual(try! buffer.read(), {{ operation.expected }})
            {%- endif %}
        {%- elif operation.operation == "write" %}
            {%- ifnot operation.should_succeed %}
            XCTAssertThrowsError(try buffer.write({{ operation.item }})) { error in
                XCTAssertEqual(error as? CircularBufferError, .bufferFull)
            }
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