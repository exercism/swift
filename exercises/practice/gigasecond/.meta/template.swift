import Testing
import Foundation
@testable import {{exercise|camelCase}}

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct {{exercise|camelCase}}Tests {
    let dateFormatter = ISO8601DateFormatter()
    let dateTimeFormatter = ISO8601DateFormatter()

    init() {
        dateFormatter.formatOptions = [.withFullDate]
        dateTimeFormatter.formatOptions = [.withFullDate, .withFullTime]
    }

    {% for case in cases %}
    {% if forloop.first -%}
        @Test("{{case.description}}")
    {% else -%}
        @Test("{{case.description}}", .enabled(if: RUNALL))
    {% endif -%}
    func test{{case.description |camelCase }}() {
    {%- if case.scenarios[0] == "date" -%}
        #expect(gigasecond(from: dateFormatter.date(from: "{{case.input.moment}}")!) == dateTimeFormatter.date(from: "{{case.expected}}Z")!)
    {%- elif case.scenarios[0] == "datetime" -%}
        #expect(gigasecond(from: dateTimeFormatter.date(from: "{{case.input.moment}}Z")!) == dateTimeFormatter.date(from: "{{case.expected}}Z")!)
    {%- endif -%}
    }
    {% endfor -%}
}
