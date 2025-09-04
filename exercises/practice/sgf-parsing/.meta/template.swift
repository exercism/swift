import Testing
import Foundation
@testable import {{ exercise|camelCase }}

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct {{ exercise|camelCase }}Tests {
    {% for case in cases %}
    {% if forloop.first -%}
        @Test("{{ case.description }}")
    {% else -%}
        @Test("{{ case.description }}", .enabled(if: RUNALL))
    {% endif -%}
    func test{{ case.description|camelCase }}() throws {
        {%- if case.expected.error -%}
            {%- if case.expected.error == "tree with no nodes" %}
                #expect(throws: SGFParsingError.noNodes)
            {%- elif case.expected.error == "tree missing" %}
                #expect(throws: SGFParsingError.missingTree)
            {%- elif case.expected.error == "properties without delimiter" %}
                #expect(throws: SGFParsingError.noDelimiter)
            {%- elif case.expected.error == "property must be in uppercase" %}
                #expect(throws: SGFParsingError.lowerCaseProperty)
            {%- endif -%}
            { try {{ case.property }}("{{ case.input.encoded|inspect }}") }
        {%- else -%}
            let expectedTree = CGFTree(jsonString: "{{ case.expected|jsonString }}")
            let actualTree = try parse("{{ case.input.encoded|inspect }}")
            #expect(expectedTree == actualTree, "Expect trees to match")
        {%- endif -%}
    }
    {% endfor -%}
}
