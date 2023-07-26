import XCTest
@testable import {{exercise|cammelcase}}
class {{exercise|cammelcase}}Tests: XCTestCase {
    let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

    {% for case in cases %}
    {% if forloop.first %}
        func test{{case.description |cammelcase }}() {
    {% else -%}
        func test{{case.description |cammelcase }}() throws {
        try XCTSkipIf(true && !runAll) // change true to false to run this test
    {% endif -%}
        let anagram = {{exercise|cammelcase}}(word: "{{case.input.word}}")
        let results = anagram.match({{case.input.list}})
        {%- if case.expected %}
        let expected = ["{{case.expected}}"]
        {%- else %}
        let expected = [String]()
        {%- endif %}
        XCTAssertEqual(results, expected)
    }
    {% endfor -%}
}
