import XCTest
@testable import {{exercise|camelCase}}
class {{exercise|camelCase}}Tests: XCTestCase {
    let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

    {% outer: for case in cases %}
        {%- for subCases in case.cases %}
        {%- if subCases.cases %}
        {%- for subSubCases in subCases.cases %}
            func test{{subSubCases.description |camelCase }}() throws {
            try XCTSkipIf(true && !runAll) // change true to false to run this test
            let garden = Garden("{{subSubCases.input.diagram | inspect}}")
            XCTAssertEqual(garden.plantsForChild("{{subSubCases.input.student}}"), {{subSubCases.expected | toEnumArray}})
        }
        {% endfor -%}
        {%- else %}
        {%- if forloop.outer.first and forloop.first %}
            func test{{subCases.description |camelCase }}() {
        {%- else %}
            func test{{subCases.description |camelCase }}() throws {
            try XCTSkipIf(true && !runAll) // change true to false to run this test
        {%- endif %}
            let garden = Garden("{{subCases.input.diagram | inspect}}")
            XCTAssertEqual(garden.plantsForChild("{{subCases.input.student}}"), {{subCases.expected | toEnumArray}})
        }
        {%- endif %}
        {% endfor -%}
    {% endfor -%}
}
