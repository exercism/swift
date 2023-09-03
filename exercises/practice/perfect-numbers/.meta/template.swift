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
        {%- ifnot subCases.expected.error %}
            XCTAssertEqual(try! classify(number: {{subCases.input.number}}), .{{subCases.expected}})
        {%- else %}
            XCTAssertThrowsError(try classify(number: {{subCases.input.number}})) { error in
                XCTAssertEqual(error as? ClassificationError, .invalidInput)
            }
        {%- endif %}
        }
        {% endfor -%}
    {% endfor -%}
}
