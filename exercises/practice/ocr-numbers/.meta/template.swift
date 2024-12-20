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
        let input = {{case.input.rows | toStringArray}}
        {% if case.expected.error -%}
        #expect(throws: OcrNumberError.invalidInput) {
            try OcrNumber.convert(rows: input)
        }
        {% else -%}
        #expect(try! OcrNumber.convert(rows: input) == "{{case.expected}}")
        {% endif -%}
    }
    {% endfor -%}
}
