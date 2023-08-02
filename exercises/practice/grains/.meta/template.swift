import XCTest
@testable import {{exercise|camelCase}}
class {{exercise|camelCase}}Tests: XCTestCase {
    let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

    {% outer: for case in cases %}
        {% ifnot case.expected %}
            {%- for subCases in case.cases %}
            {%- if forloop.outer.first and forloop.first %}
                func test{{subCases.description |camelCase }}() {
            {%- else %}
                func test{{subCases.description |camelCase }}() throws {
                try XCTSkipIf(true && !runAll) // change true to false to run this test
            {%- endif %}
            {%- ifnot subCases.expected.error %}
            XCTAssertEqual(try! Grains.square({{subCases.input.square}}), {{subCases.expected}})
            {%- else %}
            XCTAssertThrowsError(try Grains.square({{subCases.input.square}})) { error in
                {%- if subCases.input.square < 1 %}
                XCTAssertEqual(error as? GrainsError, GrainsError.inputTooLow)
                {%- elif subCases.input.square > 64 %}
                XCTAssertEqual(error as? GrainsError, GrainsError.inputTooHigh)
                {%- endif %}
            }
            {%- endif -%}

        }
        {% endfor -%}
        {%- else %}
        func test{{subCases.description |camelCase }}{{ forloop.outer.counter }}() throws {
        try XCTSkipIf(true && !runAll) // change true to false to run this test
        XCTAssertEqual(try! Grains.total, {{case.expected}})
        }
        {%- endif %}
    {% endfor -%}
}
