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
        let input = {{case.input.rows | toStringArray}}
        {% if case.expected.error -%}
        XCTAssertThrowsError(try OcrNumber.convert(rows: input)) {
            XCTAssertEqual($0 as? OcrNumberError, .invalidInput)
        }
        {% else -%}
        XCTAssertEqual(try! OcrNumber.convert(rows: input), "{{case.expected}}")
        {% endif -%}
    }
    {% endfor -%}
}
