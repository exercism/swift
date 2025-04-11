import Testing
import Foundation
import Numerics
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
        let age = SpaceAge({{case.input.seconds}})
        #expect(age.on{{case.input.planet |camelCase}}.isApproximatelyEqual(to: {{case.expected | round:2 }}, relativeTolerance: 0.03))
    }
    {% endfor -%}
}
