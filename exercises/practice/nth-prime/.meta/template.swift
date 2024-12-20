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
    {% if case.expected.error -%}
        #expect(throws: PrimeError.noZerothPrime) {try nthPrime({{case.input.number}})}
    {% else -%}
        #expect(try! nthPrime({{case.input.number}}) == {{case.expected}})
    {% endif -%}
    }
    {% endfor -%}
}
