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
        {% ifnot case.input.dominoes -%}
        let input = [(Int, Int)]()
        {% else -%}
        let input = {{case.input.dominoes | toTupleArray}}
        {% endif -%}

        {% if case.expected -%}
            #expect(Dominoes(input).chained)
        {% else -%}
            #expect(!Dominoes(input).chained)
        {% endif -%}
    }
    {% endfor -%}
}
