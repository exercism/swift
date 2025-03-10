import XCTest
@testable import {{exercise|camelCase}}
class {{exercise|camelCase}}Tests: XCTestCase {
    let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

    {% outer: for case in cases %}
        {%- for subCases in case.cases %}
        {%- if forloop.outer.first and forloop.first %}
            func test{{subCases.description |camelCase }}{{ forloop.outer.counter }}{{ forloop.counter }}() {
        {%- else %}
            func test{{subCases.description |camelCase }}{{ forloop.outer.counter }}{{ forloop.counter }}() throws {
            try XCTSkipIf(true && !runAll) // change true to false to run this test
        {%- endif %}
            {%- if subCases.property == "append" %}
                let input1 : [Int] = {{ subCases.input.list1 }}
                let input2 : [Int]= {{ subCases.input.list2 }}
                let expected : [Int] = {{ subCases.expected }}
                XCTAssertEqual(ListOps.append(input1, input2), expected)
            {%- elif subCases.property == "concat" %}
                {%- ifnot subCases.expected %}
                    let expected = [Int]()
                {%- else %}
                    let expected = {{ subCases.expected }}
                {%- endif %}
                XCTAssertEqual(ListOps.concat({% ifnot subCases.input.lists %}[]{% endif %} {% for list in subCases.input.lists %}{% ifnot forloop.first %},{% endif %}{{list}} {% endfor %}), expected)
            {%- elif subCases.property == "filter" %}
                let input : [Int] = {{ subCases.input.list }}
                let expected : [Int] = {{ subCases.expected }}
                XCTAssertEqual(ListOps.filter(input) {{subCases.input.function | listOps}}, expected)
            {%- elif subCases.property == "length" %}
                let input : [Int] = {{ subCases.input.list }}
                let expected : Int = {{ subCases.expected }}
                XCTAssertEqual(ListOps.length(input), expected)
            {%- elif subCases.property == "map" %}
                let input : [Int] = {{ subCases.input.list }}
                let expected : [Int] = {{ subCases.expected }}
                XCTAssertEqual(ListOps.map(input) {{subCases.input.function | listOps}} , expected)
            {%- elif subCases.property == "foldl" %}
                let input : [Int] = {{ subCases.input.list }}
                let expected : Int = {{ subCases.expected }}
                XCTAssertEqual(ListOps.foldLeft(input, accumulated: {{ subCases.input.initial }}, combine: {{ subCases.input.function | listOps }}), expected)
            {%- elif subCases.property == "foldr" %}
                let input : [Int] = {{ subCases.input.list }}
                let expected : Int = {{ subCases.expected }}
                XCTAssertEqual(ListOps.foldRight(input, accumulated: {{ subCases.input.initial }}, combine: {{ subCases.input.function | listOps }}), expected)
            {%- elif subCases.property == "reverse" %}
                {%- ifnot subCases.input.list  %}
                    let input = [Int]()
                {%- else %}
                    let input = {{ subCases.input.list }}
                {%- endif %}
                {%- ifnot subCases.expected %}
                    let expected = [Int]()
                {%- else %}
                    let expected = {{ subCases.expected }}
                {%- endif %}
                XCTAssertEqual(ListOps.reverse(input), expected)
            {%- endif %}
        }
        {% endfor -%}
    {% endfor -%}
}
