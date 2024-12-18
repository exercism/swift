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
        let legacy = {{case.input.legacy | toStringDictionary}}
        let expected = {{case.expected | toStringDictionary}}
        let results = ETL.transform(legacy)

        #expect(results == expected)
    }
    {% endfor -%}
}
