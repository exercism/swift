import XCTest
@testable import {{exercise|camelCase}}
class {{exercise|camelCase}}Tests: XCTestCase {
    let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false
    let emptyArray = [Int]()

    {% outer: for case in cases %}
        {%- for subCases in case.cases %}
        {%- if forloop.outer.first and forloop.first %}
            func test{{subCases.description |camelCase }}{{ forloop.outer.counter }}() {
        {%- else %}
            func test{{subCases.description |camelCase }}{{ forloop.outer.counter }}() throws {
            try XCTSkipIf(true && !runAll) // change true to false to run this test
        {%- endif %}
        {%- if subCases.input | length == 2 and not subCases.input.element %}
            {%- if subCases.input.set1 %}
            let set1 = {{exercise|camelCase}}({{subCases.input.set1}})
            {%- else %}
            let set1 = {{exercise|camelCase}}(emptyArray)
            {%- endif %}
            {%- if subCases.input.set2 %}
            let set2 = {{exercise|camelCase}}({{subCases.input.set2}})
            {%- else %}
            let set2 = {{exercise|camelCase}}(emptyArray)
            {%- endif %}
        {%- else %}
            {%- if subCases.input.set %}
            var customSet = {{exercise|camelCase}}({{subCases.input.set}})
            {%- else %}
            var customSet = {{exercise|camelCase}}(emptyArray)
            {%- endif %}
        {%- endif %}

        {%- if subCases.property == "empty" %}
            {%- if subCases.expected %}
            XCTAssertTrue(customSet.isEmpty)
            {%- else %}
            XCTAssertFalse(customSet.isEmpty)
            {%- endif %}
        {%- elif subCases.property == "contains"%}
            {%- if subCases.expected %}
            XCTAssertTrue(customSet.contains({{subCases.input.element}}))
            {%- else %}
            XCTAssertFalse(customSet.contains({{subCases.input.element}}))
            {%- endif %}
        {%- elif subCases.property == "subset" %}
            {%- if subCases.expected %}
            XCTAssertTrue(set1.isSubset(of: set2))
            {%- else %}
            XCTAssertFalse(set1.isSubset(of: set2))
            {%- endif %}
        {%- elif subCases.property == "disjoint" %}
            {%- if subCases.expected %}
            XCTAssertTrue(set1.isDisjoint(with: set2))
            {%- else %}
            XCTAssertFalse(set1.isDisjoint(with:set2))
            {%- endif %}
        {%- elif subCases.property == "equal" %}
            {%- if subCases.expected %}
            XCTAssertEqual(set1, set2)
            {%- else %}
            XCTAssertNotEqual(set1, set2)
            {%- endif %}
        {%- elif subCases.property == "add"%}
            customSet.add({{subCases.input.element}})
            XCTAssertEqual(customSet, {{exercise|camelCase}}({{subCases.expected}}))
        {%- elif subCases.property == "intersection" %}
            XCTAssertEqual(set1.intersection(set2), {{exercise|camelCase}}({{subCases.expected}}))
        {%- elif subCases.property == "union" %}
            XCTAssertEqual(set1.union(set2), {{exercise|camelCase}}({{subCases.expected}}))
        {%- elif subCases.property == "difference" %}
            XCTAssertEqual(set1.difference(set2), {{exercise|camelCase}}({{subCases.expected}}))
        {%- endif %}
        }
        {% endfor -%}
    {% endfor -%}
}
