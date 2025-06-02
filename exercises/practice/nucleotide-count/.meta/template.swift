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
        #expect(throws: NucleotideCountErrors.invalidNucleotide) {
            try DNA(strand: "{{case.input.strand}}")
        }
    {% else -%}
        let dna = try! DNA(strand: "{{case.input.strand}}")
        let results = dna.counts()
        let expected = {{case.expected | toStringDictionary}}
        #expect(results == expected)
    {% endif -%}
    }
    {% endfor -%}
}
