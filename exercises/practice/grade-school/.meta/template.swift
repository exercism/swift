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
    var school = GradeSchool()
    {%- if case.property == "add" %}
        {% for student in case.input.students -%}
        {%- if case.expected[forloop.counter0] %}
        XCTAssertTrue(school.addStudent("{{student[0]}}", grade: {{student[1]}}))
        {%- else %}
        XCTAssertFalse(school.addStudent("{{student[0]}}", grade: {{student[1]}}))
        {%- endif -%}
        {% endfor %}
    {%- else %}
        {% for student in case.input.students -%}
            school.addStudent("{{student[0]}}", grade: {{student[1]}})
        {% endfor %}
        {%- if case.property == "roster" %}
        XCTAssertEqual(school.roster(), {{case.expected | toStringArray}})
            {%- elif case.property == "grade" %}
        XCTAssertEqual(school.studentsInGrade({{case.input.desiredGrade}}), {{case.expected | toStringArray}})
            {%- endif %}
    {%- endif -%}
    }
    {% endfor -%}
}
