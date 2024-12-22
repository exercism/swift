import Testing
import Foundation
@testable import {{exercise|camelCase}}

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct {{exercise|camelCase}}Tests {
    {% outer: for case in cases %}
        {%- for subCases in case.cases %}
        {%- if forloop.outer.first and forloop.first %}
            @Test("{{subCases.description}}")
        {%- else %}
            @Test("{{subCases.description}}", .enabled(if: RUNALL))
        {%- endif %}
            func test{{subCases.description |camelCase }}{{ forloop.outer.counter }}() {
            {%- if subCases.property == "append" %}
            let list = {{exercise | camelCase}}.{{subCases.property}}({{subCases.input.list1 | defaultArray}}, {{subCases.input.list2 | defaultArray}})
            let expected = {{subCases.expected | defaultArray}}
            #expect(list == expected)
            {%- elif subCases.property == "concat" %}
            let list = {{exercise | camelCase}}.{{subCases.property}}({{subCases.input.lists | defaultArray: "[Int]"}})
            let expected = {{subCases.expected | defaultArray}}
            #expect(list == expected)
            {%- elif subCases.property == "filter" %}
            let list = {{exercise | camelCase}}.{{subCases.property}}({{subCases.input.list | defaultArray}}) { $0 % 2 == 1 }
            let expected = {{subCases.expected | defaultArray}}
            #expect(list == expected)
            {%- elif subCases.property == "length" %}
            let length = {{exercise | camelCase}}.{{subCases.property}}({{subCases.input.list}})
            let expected = {{subCases.expected}}
            #expect(length == expected)
            {%- elif subCases.property == "map" %}
            let list = {{exercise | camelCase}}.{{subCases.property}}({{subCases.input.list | defaultArray}}) { $0 + 1 }
            let expected = {{subCases.expected | defaultArray}}
            #expect(list == expected)
            {%- elif subCases.property == "foldl" or subCases.property == "foldr" %}
            {%- if subCases.input.function == "(acc, el) -> el * acc" %}
            let value = {{exercise | camelCase}}.{{subCases.property | listOps}}({{subCases.input.list}}, accumulated: {{subCases.input.initial}}.0) { $0 * $1 }
            {%- elif subCases.input.function == "(acc, el) -> el + acc" %}
            let value = {{exercise | camelCase}}.{{subCases.property | listOps}}({{subCases.input.list}}, accumulated: {{subCases.input.initial}}.0) { $0 + $1 }
            {%- elif subCases.input.function == "(acc, el) -> el / acc" %}
            let value = {{exercise | camelCase}}.{{subCases.property | listOps}}({{subCases.input.list}}, accumulated: {{subCases.input.initial}}.0) { $0 / $1 }
            {%- endif %}
            let expected = {{subCases.expected}}.0
            #expect(value == expected)
            {%- elif subCases.property == "reverse" %}
            let list = {{exercise | camelCase}}.{{subCases.property}}({{subCases.input.list | defaultArray}})
            let expected = {{subCases.expected | defaultArray}}
            #expect(list == expected)
            {%- endif %}
        }
        {% endfor -%}
    {% endfor -%}
}