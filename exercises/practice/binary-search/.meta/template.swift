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
        let binarySearch = BinarySearch({{case.input.array}})
        {% if case.expected.error %}
            #expect(throws: BinarySearchError.valueNotFound) { try binarySearch.searchFor({{case.input.value}})}
            
        {%- else -%}
            #expect(try! binarySearch.searchFor({{case.input.value}}) == {{case.expected}})
        {%- endif -%}
    }
    {% endfor -%}
}
