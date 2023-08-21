import XCTest

@testable import GradeSchool

class GradeSchoolTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testRosterIsEmptyWhenNoStudentIsAdded() {
    var school = GradeSchool()

    XCTAssertEqual(school.roster(), [])
  }

  func testAddAStudent() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var school = GradeSchool()

    XCTAssertTrue(school.addStudent("Aimee", grade: 2))
  }

  func testStudentIsAddedToTheRoster() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var school = GradeSchool()
    school.addStudent("Aimee", grade: 2)

    XCTAssertEqual(school.roster(), ["Aimee"])
  }

  func testAddingMultipleStudentsInTheSameGradeInTheRoster() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var school = GradeSchool()

    XCTAssertTrue(school.addStudent("Blair", grade: 2))
    XCTAssertTrue(school.addStudent("James", grade: 2))
    XCTAssertTrue(school.addStudent("Paul", grade: 2))
  }

  func testMultipleStudentsInTheSameGradeAreAddedToTheRoster() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var school = GradeSchool()
    school.addStudent("Blair", grade: 2)
    school.addStudent("James", grade: 2)
    school.addStudent("Paul", grade: 2)

    XCTAssertEqual(school.roster(), ["Blair", "James", "Paul"])
  }

  func testCannotAddStudentToSameGradeInTheRosterMoreThanOnce() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var school = GradeSchool()

    XCTAssertTrue(school.addStudent("Blair", grade: 2))
    XCTAssertTrue(school.addStudent("James", grade: 2))
    XCTAssertFalse(school.addStudent("James", grade: 2))
    XCTAssertTrue(school.addStudent("Paul", grade: 2))
  }

  func testStudentNotAddedToSameGradeInTheRosterMoreThanOnce() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var school = GradeSchool()
    school.addStudent("Blair", grade: 2)
    school.addStudent("James", grade: 2)
    school.addStudent("James", grade: 2)
    school.addStudent("Paul", grade: 2)

    XCTAssertEqual(school.roster(), ["Blair", "James", "Paul"])
  }

  func testAddingStudentsInMultipleGrades() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var school = GradeSchool()

    XCTAssertTrue(school.addStudent("Chelsea", grade: 3))
    XCTAssertTrue(school.addStudent("Logan", grade: 7))
  }

  func testStudentsInMultipleGradesAreAddedToTheRoster() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var school = GradeSchool()
    school.addStudent("Chelsea", grade: 3)
    school.addStudent("Logan", grade: 7)

    XCTAssertEqual(school.roster(), ["Chelsea", "Logan"])
  }

  func testCannotAddSameStudentToMultipleGradesInTheRoster() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var school = GradeSchool()

    XCTAssertTrue(school.addStudent("Blair", grade: 2))
    XCTAssertTrue(school.addStudent("James", grade: 2))
    XCTAssertFalse(school.addStudent("James", grade: 3))
    XCTAssertTrue(school.addStudent("Paul", grade: 3))
  }

  func testStudentNotAddedToMultipleGradesInTheRoster() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var school = GradeSchool()
    school.addStudent("Blair", grade: 2)
    school.addStudent("James", grade: 2)
    school.addStudent("James", grade: 3)
    school.addStudent("Paul", grade: 3)

    XCTAssertEqual(school.roster(), ["Blair", "James", "Paul"])
  }

  func testStudentsAreSortedByGradesInTheRoster() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var school = GradeSchool()
    school.addStudent("Jim", grade: 3)
    school.addStudent("Peter", grade: 2)
    school.addStudent("Anna", grade: 1)

    XCTAssertEqual(school.roster(), ["Anna", "Peter", "Jim"])
  }

  func testStudentsAreSortedByNameInTheRoster() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var school = GradeSchool()
    school.addStudent("Peter", grade: 2)
    school.addStudent("Zoe", grade: 2)
    school.addStudent("Alex", grade: 2)

    XCTAssertEqual(school.roster(), ["Alex", "Peter", "Zoe"])
  }

  func testStudentsAreSortedByGradesAndThenByNameInTheRoster() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var school = GradeSchool()
    school.addStudent("Peter", grade: 2)
    school.addStudent("Anna", grade: 1)
    school.addStudent("Barb", grade: 1)
    school.addStudent("Zoe", grade: 2)
    school.addStudent("Alex", grade: 2)
    school.addStudent("Jim", grade: 3)
    school.addStudent("Charlie", grade: 1)

    XCTAssertEqual(school.roster(), ["Anna", "Barb", "Charlie", "Alex", "Peter", "Zoe", "Jim"])
  }

  func testGradeIsEmptyIfNoStudentsInTheRoster() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var school = GradeSchool()

    XCTAssertEqual(school.studentsInGrade(1), [])
  }

  func testGradeIsEmptyIfNoStudentsInThatGrade() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var school = GradeSchool()
    school.addStudent("Peter", grade: 2)
    school.addStudent("Zoe", grade: 2)
    school.addStudent("Alex", grade: 2)
    school.addStudent("Jim", grade: 3)

    XCTAssertEqual(school.studentsInGrade(1), [])
  }

  func testStudentNotAddedToSameGradeMoreThanOnce() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var school = GradeSchool()
    school.addStudent("Blair", grade: 2)
    school.addStudent("James", grade: 2)
    school.addStudent("James", grade: 2)
    school.addStudent("Paul", grade: 2)

    XCTAssertEqual(school.studentsInGrade(2), ["Blair", "James", "Paul"])
  }

  func testStudentNotAddedToMultipleGrades() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var school = GradeSchool()
    school.addStudent("Blair", grade: 2)
    school.addStudent("James", grade: 2)
    school.addStudent("James", grade: 3)
    school.addStudent("Paul", grade: 3)

    XCTAssertEqual(school.studentsInGrade(2), ["Blair", "James"])
  }

  func testStudentNotAddedToOtherGradeForMultipleGrades() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var school = GradeSchool()
    school.addStudent("Blair", grade: 2)
    school.addStudent("James", grade: 2)
    school.addStudent("James", grade: 3)
    school.addStudent("Paul", grade: 3)

    XCTAssertEqual(school.studentsInGrade(3), ["Paul"])
  }

  func testStudentsAreSortedByNameInAGrade() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var school = GradeSchool()
    school.addStudent("Franklin", grade: 5)
    school.addStudent("Bradley", grade: 5)
    school.addStudent("Jeff", grade: 1)

    XCTAssertEqual(school.studentsInGrade(5), ["Bradley", "Franklin"])
  }
}
