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
    {%- if case.expected.error -%}
        {%- if case.input.inputBase < 2 %}
            #expect(throws: BaseError.invalidInputBase) 
        {%- elif case.input.outputBase < 2 %}
            #expect(throws: BaseError.invalidOutputBase) 
        {%- elif case.input.digits | any:"isNegative" %}
            #expect(throws: BaseError.negativeDigit) 
        {%- else %}
            #expect(throws: BaseError.invalidPositiveDigit)
        {%- endif -%}
        {try Base.outputDigits(inputBase: {{case.input.inputBase}}, inputDigits: {{case.input.digits}}, outputBase: {{case.input.outputBase}})}
    {%- else -%}
        #expect(try! Base.outputDigits(inputBase: {{case.input.inputBase}}, inputDigits: {{case.input.digits}}, outputBase: {{case.input.outputBase}}) == {{case.expected}})
    {%- endif -%}
    }
    {% endfor -%}
}
