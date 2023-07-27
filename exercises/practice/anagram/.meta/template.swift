import XCTest
@testable import {{exercise|camelCase}}
class {{exercise|camelCase}}Tests: XCTestCase {
    let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

    {% for case in cases %}
    {% if forloop.first %}
        func test{{case.description |camelCase }}() {
    {% else -%}
        func test{{case.description |camelCase }}() throws {
        try XCTSkipIf(true && !runAll) // change true to false to run this test
    {% endif -%}
        let anagram = {{exercise|camelCase}}(word: "{{case.input.subject}}")
        let results = anagram.match({{case.input.candidates}})
        {%- if case.expected %}
            let expected = {{case.expected | toStringArray }}
        {%- else %}
        let expected = [String]()
        {%- endif %}
        XCTAssertEqual(results, expected)
    }
    {% endfor -%}
}
