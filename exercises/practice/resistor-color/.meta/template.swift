import Testing
import Foundation
@testable import {{ exercise | camelCase }}

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct {{ exercise | camelCase }}Tests {

    {% for case in cases.first.cases %}
    {% if forloop.first -%}
        @Test("{{case.description}}")
    {% else -%}
        @Test("{{case.description}}", .enabled(if: RUNALL))
    {% endif -%}
    func test{{ case.description | camelCase }}() throws {
        #expect(try ResistorColor.{{ case.property }}(for: "{{ case.input.color }}") == {{ case.expected }})
    }
    {% endfor -%}

    {% for case in cases %}
    {% if forloop.first -%}
        {% continue %}
    {% endif %}
        @Test("{{case.description}}", .enabled(if: RUNALL))
        func test{{ case.description | camelCase }}() {
    {% if case.property == "colors" -%}
            #expect(ResistorColor.{{ case.property }} == {{ case.expected | toStringArray }})
    {% endif -%}
        }
    {% endfor -%}

}
