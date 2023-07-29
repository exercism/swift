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
        let year = Year(calendarYear: {{case.input.year}})
        {% if case.expected -%}
        XCTAssertTrue(year.isLeapYear)
        {% else -%}
        XCTAssertFalse(year.isLeapYear)
        {% endif -%}
    }
    {% endfor -%}
}
