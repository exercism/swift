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
            let expected = "{{subCases.expected | join:"\n" + ""}}"
            XCTAssertEqual(TwelveDaysSong.recite(start: {{subCases.input.startVerse}}, end: {{subCases.input.endVerse}}), expected)
        }
        {% endfor -%}
    {% endfor -%}
}
