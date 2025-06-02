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
            func test{{subCases.description |camelCase }}() {
        {%- if subCases.property == "create" %}
            #expect(Clock(hours: {{subCases.input.hour}}, minutes: {{subCases.input.minute}}).description == "{{subCases.expected}}")
        {%- elif subCases.property == "add"%}
            let clock = Clock(hours: {{subCases.input.hour}}, minutes: {{subCases.input.minute}}).add(minutes: {{subCases.input.value}})
            #expect(clock.description == "{{subCases.expected}}")
        {%- elif subCases.property == "subtract" %}
            let clock = Clock(hours: {{subCases.input.hour}}, minutes: {{subCases.input.minute}}).subtract(minutes: {{subCases.input.value}})
            #expect(clock.description == "{{subCases.expected}}")
        {%- elif subCases.property == "equal" %}
            let clock1 = Clock(hours: {{subCases.input.clock1.hour}}, minutes: {{subCases.input.clock1.minute}})
            let clock2 = Clock(hours: {{subCases.input.clock2.hour}}, minutes: {{subCases.input.clock2.minute}})
            {%- if subCases.expected %}
            #expect(clock1 == clock2)
            {%- else %}
            #expect(clock1 != clock2)
            {%- endif %}
        {%- endif %}
        }
        {% endfor -%}
    {% endfor -%}
}
