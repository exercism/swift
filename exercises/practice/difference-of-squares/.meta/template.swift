import XCTest
@testable import {{exercise|camelCase}}
class {{exercise|camelCase}}Tests: XCTestCase {
    let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

    {% outer: for case in cases %}
        {%- for subCases in case.cases %}
        {%- if forloop.outer.first and forloop.first %}
            func test{{subCases.description |camelCase }}() {
        {%- else %}
            func test{{subCases.description |camelCase }}() throws {
            try XCTSkipIf(true && !runAll) // change true to false to run this test
        {%- endif %}
            XCTAssertEqual({{subCases.expected}}, Squares({{subCases.input.number}}).{{subCases.property}})
        }
        {% endfor -%}
    {% endfor -%}
}
