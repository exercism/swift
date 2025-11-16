import Testing
import Foundation
@testable import {{ exercise|camelCase }}

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct {{ exercise|camelCase }}Tests {
    {% for case in cases %}
    {% if forloop.first -%}
        @Test("{{case.description}}")
    {% else -%}
        @Test("{{case.description}}", .enabled(if: RUNALL))
    {% endif -%}
    func test{{ case.description|camelCase }}() {
        #expect({{ case.property }}({{ case.input.dice }}, category: category("{{ case.input.category }}")) == {{case.expected}})
    }
    {% endfor -%}
}

func category(_ raw: String) -> YachtCategory {
    guard let category = YachtCategory(rawValue: raw) else {
        #expect(Bool(false), "Invalid test category: \(raw)")
        return .ones
    }
    return category
}
