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
        let legacy = {{case.input.legacy | toStringDictionary}}
        let expected = {{case.expected | toStringDictionary}}
        let results = ETL.transform(legacy)

        XCTAssertEqual(results, expected)
    }
    {% endfor -%}
}
