import XCTest

class GradeSchoolTest: XCTestCase
{

    func testAnEmptySchool() {
        let school = GradeSchool()
        let expected = [:]
        let result = school.db
        XCTAssertEqualObjects(result, expected)
    }
    
    func testAddStudent() {
        let school = GradeSchool()
        school.addStudent("Aimee", grade: 2)
        let result = school.db
        let expected: Dictionary = [2: ["Aimee"]]
        XCTAssertEqualObjects(result, expected)
    }
    
    func testAddMoreStudentsInSameClass() {
        let school = GradeSchool()
        school.addStudent("Fred", grade: 2)
        school.addStudent("James", grade: 2)
        school.addStudent("Paul", grade: 2)
        let result = school.db
        let expected = [2: ["Fred", "James", "Paul"]]
        XCTAssertEqualObjects(result, expected)
    }
    
    func testAddStudentsToDifferentGrades() {
        let school = GradeSchool()
        school.addStudent("Chelsea", grade: 3)
        school.addStudent("Logan", grade: 7)
        let result = school.db
        let expected = [3: ["Chelsea"], 7: ["Logan"]]
        XCTAssertEqualObjects(result, expected)
    }

    func testGetStudentsInAGrade() {
        let school = GradeSchool()
        school.addStudent("Franklin", grade: 5)
        school.addStudent("Bradley", grade: 5)
        school.addStudent("Jeff", grade: 1)
        let result = school.studentsInGrade(5)
        let expected = [ "Franklin", "Bradley" ]
        XCTAssertEqualObjects(result, expected)
    }

    func testGetStudentsInANonExistantGrade() {
        let school = GradeSchool()
        let result = school.studentsInGrade(1)
    
        let expected: String[] = []
        XCTAssertEqualObjects(result, expected)
    }
    
    func testSortSchool() {
        let school = GradeSchool()
        
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
        
        XCTAssertEqualObjects(result, expected)
    }
}