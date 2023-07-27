import XCTest
@testable import {{exercise|camelCase}}
class {{exercise|camelCase}}Tests: XCTestCase {
    let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

    {% for case in cases %}
    {% if forloop.first -%}
        func test{{case.description |camelCase }}() {
    {% else -%}
        func test{{case.description |camelCase }}() throws {
        try XCTSkipIf(true && !runAll) // change true to false to run this test
    {% endif -%}
    {%- if case.expected.error -%}
        XCTAssertThrowsError(try Base.outputDigits(inputBase: {{case.input.inputBase}}, inputDigits: {{case.input.digits}}, outputBase: {{case.input.outputBase}})) { error in
        {%- if case.input.inputBase < 2 %}
            XCTAssertEqual(error as? BaseError, BaseError.invalidInputBase)
        {%- elif case.input.outputBase < 2 %}
            XCTAssertEqual(error as? BaseError, BaseError.invalidOutputBase)
        {%- elif case.input.digits | any:"isNegative" %}
            XCTAssertEqual(error as? BaseError, BaseError.negativeDigit)
        {%- else %}
            XCTAssertEqual(error as? BaseError, BaseError.invalidPositiveDigit)
        {%- endif -%}
        }
    {%- else -%}
        XCTAssertEqual(try! Base.outputDigits(inputBase: {{case.input.inputBase}}, inputDigits: {{case.input.digits}}, outputBase: {{case.input.outputBase}}), {{case.expected}})
    {%- endif -%}
    }
    {% endfor -%}
}
