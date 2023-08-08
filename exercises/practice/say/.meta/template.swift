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
        {%- ifnot case.expected.error -%}
        XCTAssertEqual(try! say(number: {{case.input.number}}), "{{case.expected}}")
        {%- else %}
        XCTAssertThrowsError(try say(number: {{case.input.number}})) { error in
            XCTAssertEqual(error as? SayError, SayError.outOfRange)
        }
        {%- endif %}
    }
    {% endfor -%}
}
