import Foundation
import Testing

@testable import {{ exercise|camelCase }}

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite
struct {{ exercise|camelCase }}Tests {
    
    {% outer: for case in cases %}
        {%- for subCases in case.cases %}
            {%- if forloop.outer.first and forloop.first %}
                @Test("{{ subCases.description }}")
            {% else -%}
                @Test("{{ subCases.description }}", .enabled(if: RUNALL))
            {% endif -%}
            func test{{ subCases.description|camelCase }}() {
                {%- if subCases.input|contains:"set" %}
                    {%- if (subCases.property == "empty" or subCases.property == "contains") %}
                    let
                    {%- else %}
                    var
                    {%- endif %}
                    customSet = {{ exercise|camelCase }}(
                        {%- if subCases.input.set -%}
                            {{ subCases.input.set }}
                        {%- else -%}
                            [Int]()
                        {%- endif -%}
                    )
                {%- elif subCases.input|contains:"set1" and subCases.input|contains:"set2" %}
                    let set1 = {{ exercise|camelCase }}(
                        {%- if subCases.input.set1 -%} 
                            {{ subCases.input.set1 }}
                        {%- else -%}
                            [Int]()
                        {%- endif -%}
                    )
                    let set2 = {{ exercise|camelCase }}(
                        {%- if subCases.input.set2 -%} 
                            {{ subCases.input.set2 }}
                        {%- else -%}
                            [Int]()
                        {%- endif -%}
                    )
                {%- endif %}

                {%- if subCases.property == "empty" %}
                    #expect(customSet.isEmpty == {{ subCases.expected|toBoolean }})
                {%- elif subCases.property == "contains" %}
                    #expect(customSet.contains({{ subCases.input.element }}) == {{ subCases.expected|toBoolean }})
                {%- elif subCases.property == "subset" %}
                    #expect(set1.isSubset(of: set2) == {{ subCases.expected|toBoolean }})
                {%- elif subCases.property == "disjoint" %}
                    #expect(set1.isDisjoint(with: set2) == {{ subCases.expected|toBoolean }})
                {%- elif subCases.property == "equal" %}
                    #expect((set1 == set2) == {{ subCases.expected|toBoolean }})
                {%- elif subCases.property == "add"%}
                    customSet.add({{subCases.input.element}})
                    #expect(customSet == {{ exercise|camelCase }}({{ subCases.expected }}))
                {%- elif subCases.property == "intersection" %}
                    #expect(set1.intersection(set2) == {{ exercise|camelCase }}({{ subCases.expected }}))
                {%- elif subCases.property == "union" %}
                    #expect(set1.union(set2) == {{ exercise|camelCase }}({{ subCases.expected }}))
                {%- elif subCases.property == "difference" %}
                    #expect(set1.difference(set2) == {{ exercise|camelCase }}({{ subCases.expected }}))
                {%- endif %}
            }
        {% endfor -%}
    {% endfor -%}

}
