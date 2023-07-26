import XCTest
@testable import {{exercise|cammelcase}}
class {{exercise|cammelcase}}Tests: XCTestCase {
    let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

    {% for case in cases %}
    {% if forloop.first -%}
        func test{{case.description |cammelcase }}() {
    {% else -%}
        func test{{case.description |cammelcase }}() throws {
        try XCTSkipIf(true && !runAll) // change true to false to run this test
    {% endif -%}
        XCTAssertEqual("{{case.expected}}", Acronym.abbreviate("{{case.input.phrase}}"))
    }
    {% endfor -%}
}
