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
    {% if case.expected.error -%}
        XCTAssertThrowsError(try NumberSeries("{{case.input.digits}}").largestProduct({{case.input.span}})) { error in
        {% if case.expected.error == "span must be smaller than string length" -%}
            XCTAssertEqual(error as? NumberSeriesError, NumberSeriesError.spanLongerThanInput)
        {% elif case.expected.error == "digits input must only contain digits" -%}
            XCTAssertEqual(error as? NumberSeriesError, NumberSeriesError.invalidCharacter)
        {% else -%}
            XCTAssertEqual(error as? NumberSeriesError, NumberSeriesError.spanIsZeroOrNegative)
        {% endif -%}
        }
    {% else -%}
        XCTAssertEqual(try! NumberSeries("{{case.input.digits}}").largestProduct({{case.input.span}}), {{case.expected}})
    {% endif -%}
    }
    {% endfor -%}
}
