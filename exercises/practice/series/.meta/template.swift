import Testing
import Foundation
@testable import {{exercise|camelCase}}

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct {{exercise|camelCase}}Tests {
    {% for case in cases %}
    {% if forloop.first -%}
        @Test("{{case.description}}")
    {% else -%}
        @Test("{{case.description}}", .enabled(if: RUNALL))
    {% endif -%}
    func test{{case.description |camelCase }}() {
        let series = Series("{{case.input.series}}")
        {%- if case.expected.error %}
        #expect(throws:
            {% if case.expected.error == "slice length cannot be greater than series length" -%}
            SeriesError.sliceLengthLongerThanSeries
            {%- elif case.expected.error == "series cannot be empty" -%}
            SeriesError.emptySeries
            {%- elif case.expected.error == "slice length cannot be negative" or case.expected.error == "slice length cannot be zero" -%}
            SeriesError.sliceLengthZeroOrLess
            {%- endif %}
            )
            {try series.slice({{case.input.sliceLength}})}
        {%- else %}
        #expect(try! series.slice({{case.input.sliceLength}}) == {{case.expected | toStringArray}})
        {%- endif %}
    }
    {% endfor -%}
}
