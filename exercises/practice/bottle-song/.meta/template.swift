import XCTest
@testable import {{exercise|camelCase}}
class {{exercise|camelCase}}Tests: XCTestCase {
    let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

    {% outerOuter: for case in cases %}
        {%- outer: for subCases in case.cases %}
            {%- if subCases.cases %}
            {%- for subSubCases in subCases.cases %}
            {%- if forloop.outerOuter.first and forloop.outer.first and forloop.first %}
                func test{{subSubCases.description |camelCase }}{{ forloop.outer.counter }}() {
            {%- else %}
                func test{{subSubCases.description |camelCase }}{{ forloop.outer.counter }}() throws {
                try XCTSkipIf(true && !runAll) // change true to false to run this test
            {%- endif %}
                let bottleSong = BottleSong(bottles: {{subSubCases.input.startBottles}})
                let expected = {{subSubCases.expected | toStringArray }}
                XCTAssertEqual(bottleSong.song(takedown: {{subSubCases.input.takeDown}}), expected)
            }
            {% endfor -%}
            {%- else %}
            {%- if forloop.outerOuter.first and forloop.outer.first  %}
                func test{{subCases.description |camelCase }}{{ forloop.outer.counter }}() {
            {%- else %}
                func test{{subCases.description |camelCase }}{{ forloop.outer.counter }}() throws {
                try XCTSkipIf(true && !runAll) // change true to false to run this test
            {%- endif %}
                let bottleSong = BottleSong(bottles: {{subCases.input.startBottles}})
                let expected = {{subCases.expected | toStringArray }}
                XCTAssertEqual(bottleSong.song(takedown: {{subCases.input.takeDown}}), expected)
            }
            {%- endif %} 
        {% endfor -%}
    {% endfor -%}
}
