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
        let age = SpaceAge({{case.input.seconds}})
        XCTAssertEqual(age.on{{case.input.planet |camelCase}}, {{case.expected | round:2 }}, accuracy: 0.02)
    }
    {% endfor -%}
}
