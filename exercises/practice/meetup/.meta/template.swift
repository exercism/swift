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
        let meetUp = Meetup(year: {{case.input.year}}, month: {{case.input.month}}, week: "{{case.input.week}}", weekday: "{{case.input.dayofweek}}")
        XCTAssertEqual(meetUp.description, "{{case.expected}}")
    }
    {% endfor -%}
}
