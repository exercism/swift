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
        let series = Series("{{case.input.series}}")
        {%- if case.expected.error %}
        XCTAssertThrowsError(try series.slice({{case.input.sliceLength}})) { error in
            {% if case.expected.error == "slice length cannot be greater than series length" -%}
            XCTAssertEqual(error as? SeriesError, SeriesError.sliceLengthLongerThanSeries)
            {%- elif case.expected.error == "series cannot be empty" -%}
            XCTAssertEqual(error as? SeriesError, SeriesError.emptySeries)
            {%- elif case.expected.error == "slice length cannot be negative" or case.expected.error == "slice length cannot be zero" -%}
            XCTAssertEqual(error as? SeriesError, SeriesError.sliceLengthZeroOrLess)
            {%- endif %}
        }
        {%- else %}
        XCTAssertEqual(try! series.slice({{case.input.sliceLength}}), {{case.expected | toStringArray}})
        {%- endif %}
    }
    {% endfor -%}
}
