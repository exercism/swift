import XCTest
@testable import {{exercise|camelCase}}
class {{exercise|camelCase}}Tests: XCTestCase {
    let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

    let dateFormatter = ISO8601DateFormatter()
    let dateTimeFormatter = ISO8601DateFormatter()

    override func setUp() {
        dateFormatter.formatOptions = [.withFullDate]
        dateTimeFormatter.formatOptions = [.withFullDate, .withFullTime]
    }

    {% for case in cases %}
    {% if forloop.first -%}
        func test{{case.description |camelCase }}() {
    {% else -%}
        func test{{case.description |camelCase }}() throws {
       try XCTSkipIf(true && !runAll) // change true to false to run this test
    {% endif -%}
    {%- if case.scenarios[0] == "date" -%}
        XCTAssertEqual(gigasecond(from: dateFormatter.date(from: "{{case.input.moment}}")!), dateTimeFormatter.date(from: "{{case.expected}}Z")!)
    {%- elif case.scenarios[0] == "datetime" -%}
        XCTAssertEqual(gigasecond(from: dateTimeFormatter.date(from: "{{case.input.moment}}Z")!), dateTimeFormatter.date(from: "{{case.expected}}Z")!)
    {%- endif -%}
    }
    {% endfor -%}
}
