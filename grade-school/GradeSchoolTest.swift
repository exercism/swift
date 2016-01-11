import XCTest

// Apple Swift version 2.0

private extension XCTestCase {

    // workaround unit test liminitaiton  http://stackoverflow.com/questions/26092281/xctassertequals-with-two-dicts-in-swift
    func XCTAssertEqual(lhs: [Int: [String]], _ rhs: [Int: [String]]) {
        let l = lhs as NSDictionary
        let r = rhs as NSDictionary
        XCTAssert(l == r)
    }
    
    // workaround unit test liminitaiton http://stackoverflow.com/questions/29478665/comparing-optional-arrays
    func XCTAssertEqual <T : Equatable>(collection1 : [T]? , _ collection2 : [T]? ) {
        XCTAssert(collection1 == collection2)
    }
}

func ==<T: Equatable>(lhs: [T]?, rhs: [T]?) -> Bool {
    switch (lhs,rhs) {
    case (.Some(let lhs), .Some(let rhs)):
        return lhs == rhs
    case (.None, .None):
        return true
    default:
        return false
    }
}

class GradeSchoolTest: XCTestCase {
    
    func testAnEmptySchool() {
        let school   = GradeSchool()
        let expected = [Int: [String]]()
        let result   = school.roster
        XCTAssertEqual(result, expected)

    }

    func testAddStudent() {
        var school = GradeSchool()
        school.addStudent("Aimee", grade: 2)
        let result = school.roster
        let expected: Dictionary = [2: ["Aimee"]]
        XCTAssertEqual(Array(result.keys), Array(expected.keys))
        XCTAssertEqual(result[2], expected[2])
    }

    func testAddMoreStudentsInSameClass() {
        var school = GradeSchool()
        school.addStudent("Fred", grade: 2)
        school.addStudent("James", grade: 2)
        school.addStudent("Paul", grade: 2)
        let result   = school.roster
        let expected = [2: ["Fred", "James", "Paul"]]
        XCTAssertEqual(Array(result.keys), Array(expected.keys))
        XCTAssertEqual(result[2], expected[2])
    }

    func testAddStudentsToDifferentGrades() {
        var school = GradeSchool()
        school.addStudent("Chelsea", grade:3)
        school.addStudent("Logan", grade: 7)
        let result = school.roster
        let expected = [3: ["Chelsea"], 7: ["Logan"]]
        XCTAssertEqual(Array(result.keys).sort(>), Array(expected.keys).sort(>))
        XCTAssertEqual(result[3], expected[3])
    }

    func testGetStudentsInAGrade() {
        var school = GradeSchool()
        school.addStudent("Franklin", grade: 5)
        school.addStudent("Bradley", grade: 5)
        school.addStudent("Jeff", grade: 1)
        let result   = school.studentsInGrade(5)
        let expected = ["Franklin", "Bradley"]
        XCTAssertEqual(result, expected)
    }

    func testGetStudentsInANonExistantGrade() {
        let school = GradeSchool()
        let result = school.studentsInGrade(1)

        let expected = [String]()
        XCTAssertEqual(result, expected)
    }

    func testSortSchool() {
        var school = GradeSchool()
        school.addStudent("Jennifer", grade: 4)
        school.addStudent("Kareem", grade: 6)
        school.addStudent("Christopher", grade: 4)
        school.addStudent("Kyle", grade: 3)
        let result = school.sortedRoster

        let expected = [
            3 : ["Kyle"],
            4 : ["Christopher", "Jennifer"],
            6 : ["Kareem"]
        ]

        XCTAssertEqual(Array(result.keys).sort(>), Array(expected.keys).sort(>))
        XCTAssertEqual(result[3], expected[3])
        XCTAssertEqual(result[4], expected[4])
        XCTAssertEqual(result[6], expected[6])
    }

}
