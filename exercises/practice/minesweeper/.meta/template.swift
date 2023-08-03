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
        {% ifnot case.input.minefield -%}
        let input = [String]()
        let output = [String]()
        {% else -%}
        let input = {{case.input.minefield | toStringArray}}
        let output = {{case.expected | toStringArray}}
        {% endif -%}
        XCTAssertEqual(output, try! Board(input).transform())
    }
    {% endfor -%}
}
