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
        {%- if case.property == "largest" and case.expected.error -%}
            XCTAssertThrowsError(try PalindromeProducts.largest(from: {{case.input.min}}, to: {{case.input.max}})) { error in
                XCTAssertEqual(error as? PalindromeError, PalindromeError.invalidRange)
            }
        {%- elif case.expected.error -%}
            XCTAssertThrowsError(try PalindromeProducts.smallest(from: {{case.input.min}}, to: {{case.input.max}})) { error in
                XCTAssertEqual(error as? PalindromeError, PalindromeError.invalidRange)
            }
        {%- elif case.property == "largest" -%}
            let largest = try! PalindromeProducts.largest(from: {{case.input.min}}, to: {{case.input.max}})
            {%- ifnot case.expected.value | isNull %}
            XCTAssertEqual(largest.value, {{case.expected.value}})
            {%- else %}
            XCTAssertNil(largest.value)
            {%- endif %}
            {%- if case.expected.factors.count == 0 %}
            XCTAssertEqual(largest.factors, Set())
            {% else %}
            XCTAssertEqual(largest.factors, Set(arrayLiteral: {% for value in case.expected.factors %}{% ifnot forloop.first %}, {%- endif %}{{value}}{% endfor %}))
            {%- endif %}
        {%- else -%}
            let smallest = try! PalindromeProducts.smallest(from: {{case.input.min}}, to: {{case.input.max}})
            {%- ifnot case.expected.value | isNull %}
            XCTAssertEqual(smallest.value, {{case.expected.value}})
            {%- else %}
            XCTAssertNil(smallest.value)
            {%- endif %}
            {%- if case.expected.factors.count == 0 %}
            XCTAssertEqual(smallest.factors, Set())
            {% else %}
            XCTAssertEqual(smallest.factors, Set(arrayLiteral: {% for value in case.expected.factors %}{% ifnot forloop.first %}, {%- endif %}{{value}}{% endfor %}))
            {%- endif %}
        {% endif -%}
    }
    {% endfor -%}
}
