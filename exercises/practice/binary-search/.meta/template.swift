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
    let binarySearch = BinarySearch({{case.input.array}})
    {% if case.expected.error %}
        XCTAssertThrowsError(try binarySearch.searchFor({{case.input.value}})) { error in
            XCTAssertEqual(error as? BinarySearchError, BinarySearchError.valueNotFound)
        }
    {%- else -%}
        XCTAssertEqual(try! binarySearch.searchFor({{case.input.value}}), {{case.expected}})
    {%- endif -%}
    }
    {% endfor -%}
}
