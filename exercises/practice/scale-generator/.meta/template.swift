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
        let scaleGenerator = ScaleGenerator(tonic: "{{subCases.input.tonic}}")
        {%- if subCases.property == "chromatic" %}
            XCTAssertEqual(scaleGenerator.{{subCases.property}}(), {{subCases.expected | toStringArray }})
        {%- else %}
            XCTAssertEqual(scaleGenerator.{{subCases.property}}("{{subCases.input.intervals}}"), {{subCases.expected | toStringArray }})
        {%- endif %}
        }
        {% endfor -%}
    {% endfor -%}
}
