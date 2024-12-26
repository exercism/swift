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
        let poker = {{exercise|camelCase}}({{case.input.hands}})
        let bestHand = poker.{{case.property}}()
        let expected = "{{case.expected[0]}}"
        #expect(bestHand == expected)
    }
{% endfor -%}
}