import XCTest
@testable import {{exercise|cammelcase}}
class {{exercise|cammelcase}}Tests: XCTestCase {
    let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

    {% for case in cases %}
    func test{{case.description |cammelcase }}() {
    {%- ifnot forloop.first %}
        try XCTSkipIf(true && !runAll) // change true to false to run this test
    {% endif -%}
        XCTAssertEqual("{{case.expected}}", Acronym.abbreviate("{{case.input.phrase}}"))
    }
    {% endfor -%}
}
