#if swift(>=3.0)
    import XCTest
#endif

class GradeSchoolTest: XCTestCase {
    
    private typealias Roster = [Int : Set<String>]

    func testAnEmptySchool() {
        let school   = GradeSchool()
        let result   = school.roster
        XCTAssertTrue(result.isEmpty)
    }

    func testAddStudent() {
        var school = GradeSchool()
        school.addStudent("Aimee", grade: 2)
        let result = school.roster
        let expected: Roster = [2: ["Aimee"]]
        XCTAssertEqual(result, expected)
    }

    func testAddMoreStudentsInSameClass() {
        var school = GradeSchool()
        school.addStudent("Fred", grade: 2)
        school.addStudent("James", grade: 2)
        school.addStudent("Paul", grade: 2)
        let result = school.roster
        let expected: Roster = [2: ["Fred", "James", "Paul"]]
        XCTAssertEqual(result, expected)
    }

    func testAddStudentsToDifferentGrades() {
        var school = GradeSchool()
        school.addStudent("Chelsea", grade:3)
        school.addStudent("Logan", grade: 7)
        let result = school.roster
        let expected: Roster = [3: ["Chelsea"], 7: ["Logan"]]
        XCTAssertEqual(result, expected)
    }

    func testGetStudentsInAGrade() {
        var school = GradeSchool()
        school.addStudent("Franklin", grade: 5)
        school.addStudent("Bradley", grade: 5)
        school.addStudent("Jeff", grade: 1)
        let result = school.studentsInGrade(5)
        let expected: Set<String> = ["Franklin", "Bradley"]
        XCTAssertEqual(result, expected)
    }

    func testGetStudentsInANonExistantGrade() {
        let school = GradeSchool()
        let result = school.studentsInGrade(1)
        let expected: Set<String> = []
        XCTAssertEqual(result, expected)
    }

    func testSortSchool() {
        var school = GradeSchool()
        school.addStudent("Jennifer", grade: 4)
        school.addStudent("Kareem", grade: 6)
        school.addStudent("Christopher", grade: 4)
        school.addStudent("Kyle", grade: 3)
        let result = school.sortedRoster

        let expected: Roster = [
            3 : ["Kyle"],
            4 : ["Christopher", "Jennifer"],
            6 : ["Kareem"]
        ]
        
        XCTAssertEqual(result, expected)
    }

}
