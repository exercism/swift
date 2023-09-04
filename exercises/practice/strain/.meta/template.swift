import XCTest
@testable import {{exercise|camelCase}}
class {{exercise|camelCase}}Tests: XCTestCase {
    let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

    {% for case in cases %}
    {% if forloop.first -%}
        func test{{case.description |camelCase }}() {
    {% else -%}
        func test{{case.description |camelCase }}() throws {
        try XCTSkipIf(true && !runAll) // change true to false to run this test
    {% endif -%}
        {%- if case.input.list.count == 0 -%}
        let input : [Int] = []  
        {%- else -%}
        let input = {{case.input.list | toStringArray}} 
        {%- endif %}
        {%- if case.expected.count == 0 %}
        let expected : [Int] = []  
        {%- else %}
        let expected = {{case.expected | toStringArray}}  
        {%- endif %}
        XCTAssertEqual(input.{{case.property}} {{case.input.predicate | strain}}, expected)
    }
    {% endfor -%}
}
