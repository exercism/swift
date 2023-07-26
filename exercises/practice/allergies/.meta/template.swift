import XCTest
@testable import {{exercise|cammelcase}}
class {{exercise|cammelcase}}Tests: XCTestCase {
    let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

    {% outer: for case in cases %}
        {%- for subCases in case.cases %}
        {%- if forloop.outer.first and forloop.first %}
            func test{{subCases.description |cammelcase }}{{ forloop.outer.counter }}() {
        {%- else %}
            func test{{subCases.description |cammelcase }}{{ forloop.outer.counter }}() throws {
            try XCTSkipIf(true && !runAll) // change true to false to run this test
        {%- endif %}
            let allergies = Allergies({{subCases.input.score}})
        {%- if subCases.property == "allergicTo" %}
            {%- if subCases.expected %}
                XCTAssertTrue(allergies.{{subCases.property}}(item: "{{subCases.input.item}}"))
            {%- else %}
                XCTAssertFalse(allergies.{{subCases.property}}(item: "{{subCases.input.item}}"))
            {%- endif %}
        {%- else %}
            XCTAssertEqual(allergies.{{subCases.property}}(), {{subCases.expected}})
        {%- endif %}
        }
        {% endfor -%}
    {% endfor -%}
}
