import XCTest

// Apple Swift version 2.1

private extension XCTestCase {
    
    // Workaround unit test liminitaiton on Optional Arrays/Sets
    
    private func sameCollection<C: CollectionType where C.Generator.Element == String>(result: C?, _ expected: [String]?) -> Bool {
        guard let result = result, expected = expected else { return false }
        
        for (index, student) in result.enumerate() {
            guard index < expected.count && expected.contains(student) else { return false }
        }
        
        return true
        }

    
    func XCTAssertEqualCollection (collectionS : Set<String>? , _ collectionA : [String]? ) {
        
        XCTAssert(sameCollection(collectionS, collectionA))

    }

    func XCTAssertEqualCollection (collectionA1 : [String]?, _ collectionA2 : [String]? ) {
        
        XCTAssert(sameCollection(collectionA1, collectionA2))
        
    }
    
}


class GradeSchoolTest: XCTestCase {
    
    func testAnEmptySchool() {
        let school   = GradeSchool()
        let result   = school.roster
        XCTAssertTrue(result.isEmpty)

    }

    func testAddStudent() {
        var school = GradeSchool()
        school.addStudent("Aimee", grade: 2)
        let result = school.roster
        let expected: Dictionary = [2: ["Aimee"]]
        XCTAssertEqual(Array(result.keys), Array(expected.keys))
        XCTAssertEqualCollection(result[2], expected[2])
    }

    func testAddMoreStudentsInSameClass() {
        var school = GradeSchool()
        school.addStudent("Fred", grade: 2)
        school.addStudent("James", grade: 2)
        school.addStudent("Paul", grade: 2)
        let result   = school.roster
        let expected = [2: ["Fred", "James", "Paul"]]
        XCTAssertEqual(Array(result.keys), Array(expected.keys))
        XCTAssertEqualCollection(result[2], expected[2])
    }

    func testAddStudentsToDifferentGrades() {
        var school = GradeSchool()
        school.addStudent("Chelsea", grade:3)
        school.addStudent("Logan", grade: 7)
        let result = school.roster
        let expected = [3: ["Chelsea"], 7: ["Logan"]]
        XCTAssertEqual(Array(result.keys).sort(>), Array(expected.keys).sort(>))
        XCTAssertEqualCollection(result[3], expected[3])
    }

    func testGetStudentsInAGrade() {
        var school = GradeSchool()
        school.addStudent("Franklin", grade: 5)
        school.addStudent("Bradley", grade: 5)
        school.addStudent("Jeff", grade: 1)
        let result   = school.studentsInGrade(5)
        let expected = ["Franklin", "Bradley"]
        XCTAssertEqualCollection(result, expected)
    }

    func testGetStudentsInANonExistantGrade() {
        let school = GradeSchool()
        let result = school.studentsInGrade(1)

        let expected = [String]()
        XCTAssertEqualCollection(result, expected)
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
        XCTAssertEqualCollection(result[3], expected[3])
        XCTAssertEqualCollection(result[4], expected[4])
        XCTAssertEqualCollection(result[6], expected[6])
    }

}
