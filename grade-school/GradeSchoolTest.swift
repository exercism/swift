import XCTest

class GradeSchoolTest: XCTestCase
{

    func testAnEmptySchool() {
        let school = GradeSchool()
        let expected = [:]
        let result = school.db
        XCTAssertEqual(result, expected)
    }
    
    func testAddStudent() {
        var school = GradeSchool()
        school.addStudent("Aimee", grade: 2)
        let result = school.db
        let expected: Dictionary = [2: ["Aimee"]]
        XCTAssertEqual(result.keys.array, expected.keys.array)
        XCTAssertEqual(result[2]!, expected[2]!)
    }

    func testAddMoreStudentsInSameClass() {
        var school = GradeSchool()
        school.addStudent("Fred", grade: 2)
        school.addStudent("James", grade: 2)
        school.addStudent("Paul", grade: 2)
        let result = school.db
        let expected = [2: ["Fred", "James", "Paul"]]
        XCTAssertEqual(result.keys.array, expected.keys.array)
        XCTAssertEqual(result[2]!, expected[2]!)
    }

    func testAddStudentsToDifferentGrades() {
        var school = GradeSchool()
        school.addStudent("Chelsea", grade: 3)
        school.addStudent("Logan", grade: 7)
        let result = school.db
        let expected = [3: ["Chelsea"], 7: ["Logan"]]
        XCTAssertEqual(result.keys.array.sorted(>), expected.keys.array.sorted(>))
        XCTAssertEqual(result[3]!, expected[3]!)
    }

    func testGetStudentsInAGrade() {
        var school = GradeSchool()
        school.addStudent("Franklin", grade: 5)
        school.addStudent("Bradley", grade: 5)
        school.addStudent("Jeff", grade: 1)
        let result = school.studentsInGrade(5)
        let expected = [ "Franklin", "Bradley" ]
        XCTAssertEqual(result, expected)
    }

    func testGetStudentsInANonExistantGrade() {
        let school = GradeSchool()
        let result = school.studentsInGrade(1)
    
        let expected: [String] = []
        XCTAssertEqual(result, expected)
    }

    func testSortSchool() {
        var school = GradeSchool()
        
        school.addStudent("Jennifer", grade:4)
        school.addStudent("Kareem", grade:6)
        school.addStudent("Christopher", grade:4)
        school.addStudent("Kyle", grade: 3)
        let result = school.sortedRoster()
        
        let expected = [
            3 : ["Kyle"],
            4 : [ "Christopher", "Jennifer" ],
            6 : [ "Kareem"]
        ]
        
        XCTAssertEqual(result.keys.array.sorted(>), expected.keys.array.sorted(>))
        XCTAssertEqual(result[3]!, expected[3]!)
        XCTAssertEqual(result[4]!, expected[4]!)
        XCTAssertEqual(result[6]!, expected[6]!)
    }
}