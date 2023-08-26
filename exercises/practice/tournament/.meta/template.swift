import XCTest
@testable import {{exercise|camelCase}}
class {{exercise|camelCase}}Tests: XCTestCase {
    let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

    override func setUp() {
        tournament = Tournament()
    }

    {% for case in cases %}
    {% if forloop.first -%}
        func test{{case.description |camelCase }}() {
    {% else -%}
        func test{{case.description |camelCase }}() throws {
        try XCTSkipIf(true && !runAll) // change true to false to run this test
    {% endif -%}
        {% for row in case.input.rows -%}
        tournament.addMatch("{{row}}")
        {% endfor -%}
        let expected = {{case.expected | toStringArray }}
        XCTAssertEqual(tournament.tally(), expected)
    }
    {% endfor -%}
}
