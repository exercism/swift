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
        {% ifnot case.input.dominoes -%}
        let input = [(Int, Int)]()
        {% else -%}
        let input = {{case.input.dominoes | toTupleArray}}
        {% endif -%}

        {% if case.expected -%}
            XCTAssertTrue(Dominoes(input).chained)
        {% else -%}
            XCTAssertFalse(Dominoes(input).chained)
        {% endif -%}
    }
    {% endfor -%}
}
