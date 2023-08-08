import XCTest
@testable import {{exercise|camelCase}}
class {{exercise|camelCase}}Tests: XCTestCase {
    let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

    {% outer: for case in cases %}
        {%- for subCases in case.cases %}
        {%- if forloop.outer.first and forloop.first %}
            func test{{subCases.property |camelCase}}{{subCases.description |camelCase }}() {
        {%- else %}
            func test{{subCases.property |camelCase}}{{subCases.description |camelCase }}() throws {
            try XCTSkipIf(true && !runAll) // change true to false to run this test
        {%- endif %}
        {%- if subCases.property == "encode" %}
            XCTAssertEqual(RunLengthEncoding.encode("{{subCases.input.string}}"), "{{subCases.expected}}")
        {%- elif subCases.property == "consistency" %}
            let encoded = RunLengthEncoding.encode("{{subCases.input.string}}")
            let decoded = RunLengthEncoding.decode(encoded)
            XCTAssertEqual(decoded, "{{subCases.expected}}")
        {%- else %}
            XCTAssertEqual(RunLengthEncoding.decode("{{subCases.input.string}}"), "{{subCases.expected}}")
        {%- endif %}
        }
        {% endfor -%}
    {% endfor -%}
}
