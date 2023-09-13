import XCTest
@testable import {{exercise|camelCase}}
class {{exercise|camelCase}}Tests: XCTestCase {
    let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

    {% outer: for case in cases %}
        {%- for subCases in case.cases %}
        {%- if forloop.outer.first and forloop.first %}
            func test{{subCases.description |camelCase }}() {
        {%- else %}
            func test{{subCases.description |camelCase }}() throws {
            try XCTSkipIf(true && !runAll) // change true to false to run this test
        {%- endif %}
        {%- if subCases.property == "create" %}
            {%- if subCases.expected.error %}
                XCTAssertThrowsError(try Queen(row: {{subCases.input.queen.position.row}}, column: {{subCases.input.queen.position.column}})) { error in
                    {%- if subCases.expected.error | contains:"row"  %}
                    XCTAssertEqual(error as? QueenError, .inValidRow)
                    {%- else %}
                    XCTAssertEqual(error as? QueenError, .inValidColumn)
                    {%- endif %}
                }
            {%- else %}
                let queen = try! Queen(row: {{subCases.input.queen.position.row}}, column: {{subCases.input.queen.position.column}})
                XCTAssertEqual(queen.row, {{subCases.input.queen.position.row}})
                XCTAssertEqual(queen.column, {{subCases.input.queen.position.column}})
            {%- endif %}
        {%- else %}
            let queen = try! Queen(row: {{subCases.input.white_queen.position.row}}, column: {{subCases.input.white_queen.position.column}})
            let otherQueen = try! Queen(row: {{subCases.input.black_queen.position.row}}, column: {{subCases.input.black_queen.position.column}})
            {%- if subCases.expected %}
                XCTAssertTrue(queen.canAttack(other: otherQueen))
            {%- else %}
                XCTAssertFalse(queen.canAttack(other: otherQueen))
            {%- endif %}
        {%- endif %}
        }
        {% endfor -%}
    {% endfor -%}
}
