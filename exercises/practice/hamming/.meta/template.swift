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
        {%- ifnot case.expected.error -%}
        let result = try! Hamming.compute("{{case.input.strand1}}", against:"{{case.input.strand2}}")!
        let expected = {{case.expected}}
        XCTAssertEqual(expected, result)
        {%- else -%}
        XCTAssertThrowsError(try Hamming.compute("{{case.input.strand1}}", against:"{{case.input.strand2}}"))
        {%- endif -%}
    }
    {% endfor -%}
}
