import Testing
import Foundation

@testable import {{exercise|camelCase}}

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct {{exercise|camelCase}}Tests {
    {% outer: for case in cases %}
        {%- if case.cases %}
        {%- for subCases in case.cases %}
        {%- if subCases.cases %}
            {%- for subSubCases in subCases.cases %}
                @Test("{{subSubCases.description}}", .enabled(if: RUNALL))
                func test{{subSubCases.description |camelCase }}() {
                    let complexNumberOne = {{exercise|camelCase}}(realComponent: {{subSubCases.input.z1[0]}}, imaginaryComponent: {{subSubCases.input.z1[1]}})
                    let complexNumberTwo = {{exercise|camelCase}}(realComponent: {{subSubCases.input.z2[0]}}, imaginaryComponent: {{subSubCases.input.z2[1]}})
                    let result = complexNumberOne.{{subSubCases.property}}(complexNumber: complexNumberTwo)
                    let expected = {{exercise|camelCase}}(realComponent: {{subSubCases.expected[0]}}, imaginaryComponent: {{subSubCases.expected[1]}})
                    #expect(expected == result)
                }
            {%- endfor %}
        {%- else %}
        {%- if forloop.outer.first and forloop.first %}
            @Test("{{subCases.description}}")
        {%- else %}
            @Test("{{subCases.description}}", .enabled(if: RUNALL))
        {%- endif %}
            func test{{subCases.description |camelCase }}() {
                {%- if subCases.property == "real" or subCases.property == "imaginary" or subCases.property == "abs" or subCases.property == "conjugate" or subCases.property == "exp" %}
                let complexNumber = {{exercise|camelCase}}(realComponent: {{subCases.input.z[0] | complexNumber}}, imaginaryComponent: {{subCases.input.z[1] | complexNumber}})
                {%- if subCases.property == "real" %}
                #expect(complexNumber.real == {{subCases.expected}})
                {%- elif subCases.property == "imaginary" %}
                #expect(complexNumber.imaginary == {{subCases.expected}})
                {%- elif subCases.property == "abs" %}
                #expect(complexNumber.absolute() == {{subCases.expected}})
                {%- elif subCases.property == "conjugate" %}
                let expected = {{exercise|camelCase}}(realComponent: {{subCases.expected[0]}}, imaginaryComponent: {{subCases.expected[1]}})
                #expect(complexNumber.conjugate() == expected)
                {%- elif subCases.property == "exp" %}
                let expected = {{exercise|camelCase}}(realComponent: {{subCases.expected[0] | complexNumber}}, imaginaryComponent: {{subCases.expected[1]}})
                #expect(complexNumber.exponent() == expected)
                {%- elif subCases.property == "add" or subCases.property == "sub" or subCases.property == "mul" or subCases.property == "div" %}
                {%- endif %}
                {%- else %}
                {%- if subCases.input.z1[0] %}
                let complexNumberOne = {{exercise|camelCase}}(realComponent: {{subCases.input.z1[0]}}, imaginaryComponent: {{subCases.input.z1[1]}})
                let complexNumberTwo = {{exercise|camelCase}}(realComponent: {{subCases.input.z2}}, imaginaryComponent: nil)
                {%- else %}
                let complexNumberOne = {{exercise|camelCase}}(realComponent: {{subCases.input.z1}}, imaginaryComponent: nil)
                let complexNumberTwo = {{exercise|camelCase}}(realComponent: {{subCases.input.z2[0]}}, imaginaryComponent: {{subCases.input.z2[1]}})
                {%- endif %}
                let result = complexNumberOne.{{subCases.property}}(complexNumber: complexNumberTwo)
                let expected = {{exercise|camelCase}}(realComponent: {{subCases.expected[0]}}, imaginaryComponent: {{subCases.expected[1]}})
                #expect(expected == result)
                {%- endif %}
        }
        {%- endif %}
        {% endfor -%}
        {%- else %}
            @Test("{{case.description}}", .enabled(if: RUNALL))
            func test{{case.description |camelCase }}() {
                let complexNumberOne = {{exercise|camelCase}}(realComponent: {{case.input.z1[0]}}, imaginaryComponent: {{case.input.z1[1]}})
                let complexNumberTwo = {{exercise|camelCase}}(realComponent: {{case.input.z2[0]}}, imaginaryComponent: {{case.input.z2[1]}})
                let result = complexNumberOne.{{case.property}}(complexNumber: complexNumberTwo)
                let expected = {{exercise|camelCase}}(realComponent: {{case.expected[0]}}, imaginaryComponent: {{case.expected[1]}})
                #expect(expected == result)
        }
        {%- endif %}
    {% endfor -%}
}
