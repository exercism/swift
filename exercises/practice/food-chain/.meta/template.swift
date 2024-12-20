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
        let expected = "{{case.expected | join:"\n" + ""}}"
        #expect(expected == FoodChain.song(start: {{case.input.startVerse}}, end: {{case.input.endVerse}}))
    }
    {% endfor -%}
}
