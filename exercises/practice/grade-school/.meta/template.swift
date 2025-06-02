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
    var school = GradeSchool()
    {%- if case.property == "add" %}
        {% for student in case.input.students -%}
        {%- if case.expected[forloop.counter0] %}
        #expect(school.addStudent("{{student[0]}}", grade: {{student[1]}}))
        {%- else %}
        #expect(!school.addStudent("{{student[0]}}", grade: {{student[1]}}))
        {%- endif -%}
        {% endfor %}
    {%- else %}
        {% for student in case.input.students -%}
            school.addStudent("{{student[0]}}", grade: {{student[1]}})
        {% endfor %}
        {%- if case.property == "roster" %}
        #expect(school.roster() == {{case.expected | toStringArray}})
            {%- elif case.property == "grade" %}
        #expect(school.studentsInGrade({{case.input.desiredGrade}}) == {{case.expected | toStringArray}})
            {%- endif %}
    {%- endif -%}
    }
    {% endfor -%}
}
