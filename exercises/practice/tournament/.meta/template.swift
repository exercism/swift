import Testing
import Foundation

@testable import {{exercise|camelCase}}

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct {{exercise|camelCase}}Tests {
    private var tournament: Tournament!

    init() {
        tournament = Tournament()
    }

    {% for case in cases %}
    {% if forloop.first -%}
        @Test("{{case.description}}")
    {% else -%}
        @Test("{{case.description}}", .enabled(if: RUNALL))
    {% endif -%}
    func test{{case.description |camelCase }}() {
        {% for row in case.input.rows -%}
        tournament.addMatch("{{row}}")
        {% endfor -%}
        let expected = {{case.expected | toStringArray }}
        #expect(tournament.tally() == expected)
    }
    {% endfor -%}
}
