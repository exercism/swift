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
        {%- ifnot case.expected.error -%}
        let result = try! Hamming.compute("{{case.input.strand1}}", against:"{{case.input.strand2}}")!
        let expected = {{case.expected}}
        #expect(expected == result)
        {%- else -%}
        #expect(throws: (any Error).self) {try Hamming.compute("{{case.input.strand1}}", against:"{{case.input.strand2}}")}
        {%- endif -%}
    }
    {% endfor -%}
}
