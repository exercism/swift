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
        #expect(throws: 
        {% if case.expected.error == "span must be smaller than string length" -%}
            NumberSeriesError.spanLongerThanInput
        {% elif case.expected.error == "digits input must only contain digits" -%}
            NumberSeriesError.invalidCharacter
        {% else -%}
            NumberSeriesError.spanIsZeroOrNegative
        {% endif -%}
        ) {try NumberSeries("{{case.input.digits}}").largestProduct({{case.input.span}})}
    {% else -%}
        #expect(try! NumberSeries("{{case.input.digits}}").largestProduct({{case.input.span}}) == {{case.expected}})
    {% endif -%}
    }
    {% endfor -%}
}
