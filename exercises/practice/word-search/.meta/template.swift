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
                    WordLocation(rawInfo: {{case.expected[word]}})
                {%- endif %}
            {%- endfor %}

            #expect({{case.property}}(words: words, in: grid) == expected)
        }
    {% endfor -%}
}

fileprivate extension WordLocation {

    init?(rawInfo: [String: [String: Int]]) {
        guard
            let startDict = rawInfo["start"],
            let endDict = rawInfo["end"],
            let startRow = startDict["row"],
            let startColumn = startDict["column"],
            let endRow = endDict["row"],
             let endColumn = endDict["column"]
        else {
            return nil
        }
        let start = Location(row: startRow, column: startColumn)
        let end = Location(row: endRow, column: endColumn)
        self.init(start: start, end: end)
    }

}
