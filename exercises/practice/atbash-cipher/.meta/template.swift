import XCTest
@testable import {{exercise|camelCase}}
class {{exercise|camelCase}}Tests: XCTestCase {
    let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

    {% for case in cases %}
        {%- for subCases in case.cases %}

        {% if forloop.first -%}
            func test{{subCases.description |camelCase }}() {
        {% else -%}
            func test{{subCases.description |camelCase }}() throws {
            try XCTSkipIf(true && !runAll) // change true to false to run this test
        {% endif -%}
            {%- if subCases.property == "encode" -%}
            XCTAssertEqual("{{subCases.expected}}", AtbashCipher.encode("{{subCases.input.phrase}}"))
            {%- else -%}
            XCTAssertEqual("{{subCases.expected}}", AtbashCipher.decode("{{subCases.input.phrase}}"))
            {%- endif %}
        }
        {%- endfor %}
    {% endfor -%}
}
