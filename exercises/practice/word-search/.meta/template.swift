import Testing
import Foundation
@testable import {{exercise | camelCase}}

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct {{exercise | camelCase}}Tests {
    {% for case in cases %}
        {% if forloop.first -%}
            @Test("{{case.description}}")
        {% else -%}
            @Test("{{case.description}}", .enabled(if: RUNALL))
        {% endif -%}
        func test{{case.description | camelCase}}() {
            let grid = {{case.input.grid | toStringArray}}
            let words = {{case.input.wordsToSearchFor | toStringArray}}

            var expected = [String: WordLocation?]()
            {%- for word in case.expected %}
                expected["{{word}}"] =
                {%- if case.expected[word] | isNull -%}
                    nil
                {%- else -%}
                    WordLocation(
                        start: {{case.expected[word]["start"] | toStringDictionary}},
                        end: {{case.expected[word]["end"] | toStringDictionary}}
                    )
                {%- endif %}
            {%- endfor %}

            #expect({{case.property}}(words: words, in: grid) == expected)
        }
    {% endfor -%}
}