import Testing
import Foundation
@testable import {{exercise | camelCase}}

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct {{exercise | camelCase}}Tests {
    {% outer: for case in cases %}
        {%- for subCases in case.cases %}
        {%- if forloop.outer.first and forloop.first %}
            @Test("{{subCases.description}}")
        {%- else %}
            @Test("{{subCases.description}}", .enabled(if: RUNALL))
        {%- endif %}
            func test{{subCases.description | camelCase}}() throws {
        {%- if subCases.property == "create" %}
            {%- if subCases.expected.error %}
                {%- if subCases.expected.error | contains: "row" %}
                #expect(throws: QueenError.inValidRow)
                {%- else %}
                #expect(throws: QueenError.inValidColumn)
                {%- endif %}
                {
                    try Queen(row: {{subCases.input.queen.position.row}}, column: {{subCases.input.queen.position.column}})
                }
            {%- else %}
                #expect(throws: Never.self) {
                    let queen = try Queen(row: {{subCases.input.queen.position.row}}, column: {{subCases.input.queen.position.column}})
                    #expect(queen.row == {{subCases.input.queen.position.row}})
                    #expect(queen.column == {{subCases.input.queen.position.column}})
                }
            {%- endif %}
        {%- else %}
            #expect(throws: Never.self) {
                let queen = try Queen(row: {{subCases.input.white_queen.position.row}}, column: {{subCases.input.white_queen.position.column}})
                let otherQueen = try Queen(row: {{subCases.input.black_queen.position.row}}, column: {{subCases.input.black_queen.position.column}})
            {%- if subCases.expected %}
                #expect(queen.canAttack(other: otherQueen))
            {%- else %}
                #expect(!queen.canAttack(other: otherQueen))
            {%- endif %}
            }
        {%- endif %}
        }
        {% endfor -%}
    {% endfor -%}
}
