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
        let anagram = {{exercise|camelCase}}(word: "{{case.input.subject}}")
        let results = anagram.match({{case.input.candidates | toStringArray }})
        {%- if case.expected %}
            let expected = {{case.expected | toStringArray }}
        {%- else %}
        let expected = [String]()
        {%- endif %}
        #expect(results == expected)
    }
    {% endfor -%}
}
