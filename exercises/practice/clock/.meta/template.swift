import XCTest
@testable import {{exercise|camelCase}}
class {{exercise|camelCase}}Tests: XCTestCase {
    let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

    {% outer: for case in cases %}
        {%- for subCases in case.cases %}
        {%- if forloop.outer.first and forloop.first %}
            func test{{subCases.description |camelCase }}() {
        {%- else %}
            func test{{subCases.description |camelCase }}() throws {
            try XCTSkipIf(true && !runAll) // change true to false to run this test
        {%- endif %}
        {%- if subCases.property == "create" %}
            XCTAssertEqual(Clock(hours: {{subCases.input.hour}}, minutes: {{subCases.input.minute}}).description, "{{subCases.expected}}")
        {%- elif subCases.property == "add"%}
            let clock = Clock(hours: {{subCases.input.hour}}, minutes: {{subCases.input.minute}}).add(minutes: {{subCases.input.value}})
            XCTAssertEqual(clock.description, "{{subCases.expected}}")
        {%- elif subCases.property == "subtract" %}
            let clock = Clock(hours: {{subCases.input.hour}}, minutes: {{subCases.input.minute}}).subtract(minutes: {{subCases.input.value}})
            XCTAssertEqual(clock.description, "{{subCases.expected}}")
        {%- elif subCases.property == "equal" %}
            let clock1 = Clock(hours: {{subCases.input.clock1.hour}}, minutes: {{subCases.input.clock1.minute}})
            let clock2 = Clock(hours: {{subCases.input.clock2.hour}}, minutes: {{subCases.input.clock2.minute}})
            {%- if subCases.expected %}
            XCTAssertEqual(clock1, clock2)
            {%- else %}
            XCTAssertNotEqual(clock1, clock2)
            {%- endif %}
        {%- endif %}
        }
        {% endfor -%}
    {% endfor -%}
}
