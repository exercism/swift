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
        {% if case.input.matrix[0] -%}
        let input = {{case.input.matrix}}
        {%- else -%}
        let input = [[Int]]()
        {%- endif %}
        let saddlePoints = {{exercise|camelCase}}.{{case.property}}(input).sorted { $0.row < $1.row || $0.row == $1.row && $0.column > $1.column }
        let expected : [Position] = [
            {% for point in case.expected -%}
            Position(row: {{point.row}}, column: {{point.column}}),
            {%- endfor %}
        ].sorted {
                $0.row < $1.row || $0.row == $1.row && $0.column > $1.column
            }
        #expect(saddlePoints == expected)
    }
{% endfor -%}
}