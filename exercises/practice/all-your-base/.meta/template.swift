import XCTest
@testable import {{exercise|cammelcase}}
class {{exercise|cammelcase}}Tests: XCTestCase {
    let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

    {% for case in cases %}
    func test{{case.description |cammelcase }}() {
    {%- ifnot forloop.first %}
        try XCTSkipIf(true && !runAll) // change true to false to run this test
    {% endif -%}
    {%- if case.expected.error -%}
        XCTAssertThrowsError(try! Base.outputDigits(inputBase: {{case.input.inputBase}}, inputDigits: {{case.input.digits}}, outputBase: {{case.input.outputBase}}) { error in
            XCTAssertEqual(error as? BaseError, BaseError.invalidInputBase)
        }
        )
    {%- else -%}
        XCTAssertEqual(try! Base.outputDigits(inputBase: {{case.input.inputBase}}, inputDigits: {{case.input.digits}}, outputBase: {{case.input.outputBase}}, {{case.expected}}))
    {%- endif -%}
    }
    {% endfor -%}
}
