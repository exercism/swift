import XCTest
@testable import {{exercise|camelCase}}
class {{exercise|camelCase}}Tests: XCTestCase {
    let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

    {% outer: for case in cases %}
        {%- for subCases in case.cases %}
        {%- if forloop.outer.first and forloop.first %}
            func test{{subCases.description |camelCase }}{{ forloop.outer.counter }}() {
        {%- else %}
            func test{{subCases.description |camelCase }}{{ forloop.outer.counter }}() throws {
            try XCTSkipIf(true && !runAll) // change true to false to run this test
        {%- endif %}
        {%- if subCases.expected %}
            XCTAssertTrue(Triangle({{subCases.input.sides}}).is{{subCases.property | capitalize }})
        {%- else %}
            XCTAssertFalse(Triangle({{subCases.input.sides}}).is{{subCases.property | capitalize }})
        {%- endif %}
        }
        {% endfor -%}
    {% endfor -%}
}
