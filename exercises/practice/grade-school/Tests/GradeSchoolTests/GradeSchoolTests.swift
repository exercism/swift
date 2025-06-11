import Foundation
import Testing

@testable import GradeSchool

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct GradeSchoolTests {

  @Test("Roster is empty when no student is added")
  func testRosterIsEmptyWhenNoStudentIsAdded() {
    let school = GradeSchool()

    #expect(school.roster() == [])
  }

  @Test("Add a student", .enabled(if: RUNALL))
  func testAddAStudent() {
    let school = GradeSchool()

    #expect(school.addStudent("Aimee", grade: 2))
  }

  @Test("Student is added to the roster", .enabled(if: RUNALL))
  func testStudentIsAddedToTheRoster() {
    let school = GradeSchool()
    school.addStudent("Aimee", grade: 2)

    #expect(school.roster() == ["Aimee"])
  }

  @Test("Adding multiple students in the same grade in the roster", .enabled(if: RUNALL))
  func testAddingMultipleStudentsInTheSameGradeInTheRoster() {
    let school = GradeSchool()

    #expect(school.addStudent("Blair", grade: 2))
    #expect(school.addStudent("James", grade: 2))
    #expect(school.addStudent("Paul", grade: 2))
  }

  @Test("Multiple students in the same grade are added to the roster", .enabled(if: RUNALL))
  func testMultipleStudentsInTheSameGradeAreAddedToTheRoster() {
    let school = GradeSchool()
    school.addStudent("Blair", grade: 2)
    school.addStudent("James", grade: 2)
    school.addStudent("Paul", grade: 2)

    #expect(school.roster() == ["Blair", "James", "Paul"])
  }

  @Test("Cannot add student to same grade in the roster more than once", .enabled(if: RUNALL))
  func testCannotAddStudentToSameGradeInTheRosterMoreThanOnce() {
    let school = GradeSchool()

    #expect(school.addStudent("Blair", grade: 2))
    #expect(school.addStudent("James", grade: 2))
    #expect(!school.addStudent("James", grade: 2))
    #expect(school.addStudent("Paul", grade: 2))
  }

  @Test("Student not added to same grade in the roster more than once", .enabled(if: RUNALL))
  func testStudentNotAddedToSameGradeInTheRosterMoreThanOnce() {
    let school = GradeSchool()
    school.addStudent("Blair", grade: 2)
    school.addStudent("James", grade: 2)
    school.addStudent("James", grade: 2)
    school.addStudent("Paul", grade: 2)

    #expect(school.roster() == ["Blair", "James", "Paul"])
  }

  @Test("Adding students in multiple grades", .enabled(if: RUNALL))
  func testAddingStudentsInMultipleGrades() {
    let school = GradeSchool()

    #expect(school.addStudent("Chelsea", grade: 3))
    #expect(school.addStudent("Logan", grade: 7))
  }

  @Test("Students in multiple grades are added to the roster", .enabled(if: RUNALL))
  func testStudentsInMultipleGradesAreAddedToTheRoster() {
    let school = GradeSchool()
    school.addStudent("Chelsea", grade: 3)
    school.addStudent("Logan", grade: 7)

    #expect(school.roster() == ["Chelsea", "Logan"])
  }

  @Test("Cannot add same student to multiple grades in the roster", .enabled(if: RUNALL))
  func testCannotAddSameStudentToMultipleGradesInTheRoster() {
    let school = GradeSchool()

    #expect(school.addStudent("Blair", grade: 2))
    #expect(school.addStudent("James", grade: 2))
    #expect(!school.addStudent("James", grade: 3))
    #expect(school.addStudent("Paul", grade: 3))
  }

  @Test("Student not added to multiple grades in the roster", .enabled(if: RUNALL))
  func testStudentNotAddedToMultipleGradesInTheRoster() {
    let school = GradeSchool()
    school.addStudent("Blair", grade: 2)
    school.addStudent("James", grade: 2)
    school.addStudent("James", grade: 3)
    school.addStudent("Paul", grade: 3)

    #expect(school.roster() == ["Blair", "James", "Paul"])
  }

  @Test("Students are sorted by grades in the roster", .enabled(if: RUNALL))
  func testStudentsAreSortedByGradesInTheRoster() {
    let school = GradeSchool()
    school.addStudent("Jim", grade: 3)
    school.addStudent("Peter", grade: 2)
    school.addStudent("Anna", grade: 1)

    #expect(school.roster() == ["Anna", "Peter", "Jim"])
  }

  @Test("Students are sorted by name in the roster", .enabled(if: RUNALL))
  func testStudentsAreSortedByNameInTheRoster() {
    let school = GradeSchool()
    school.addStudent("Peter", grade: 2)
    school.addStudent("Zoe", grade: 2)
    school.addStudent("Alex", grade: 2)

    #expect(school.roster() == ["Alex", "Peter", "Zoe"])
  }

  @Test("Students are sorted by grades and then by name in the roster", .enabled(if: RUNALL))
  func testStudentsAreSortedByGradesAndThenByNameInTheRoster() {
    let school = GradeSchool()
    school.addStudent("Peter", grade: 2)
    school.addStudent("Anna", grade: 1)
    school.addStudent("Barb", grade: 1)
    school.addStudent("Zoe", grade: 2)
    school.addStudent("Alex", grade: 2)
    school.addStudent("Jim", grade: 3)
    school.addStudent("Charlie", grade: 1)

    #expect(school.roster() == ["Anna", "Barb", "Charlie", "Alex", "Peter", "Zoe", "Jim"])
  }

  @Test("Grade is empty if no students in the roster", .enabled(if: RUNALL))
  func testGradeIsEmptyIfNoStudentsInTheRoster() {
    let school = GradeSchool()

    #expect(school.studentsInGrade(1) == [])
  }

  @Test("Grade is empty if no students in that grade", .enabled(if: RUNALL))
  func testGradeIsEmptyIfNoStudentsInThatGrade() {
    let school = GradeSchool()
    school.addStudent("Peter", grade: 2)
    school.addStudent("Zoe", grade: 2)
    school.addStudent("Alex", grade: 2)
    school.addStudent("Jim", grade: 3)

    #expect(school.studentsInGrade(1) == [])
  }

  @Test("Student not added to same grade more than once", .enabled(if: RUNALL))
  func testStudentNotAddedToSameGradeMoreThanOnce() {
    let school = GradeSchool()
    school.addStudent("Blair", grade: 2)
    school.addStudent("James", grade: 2)
    school.addStudent("James", grade: 2)
    school.addStudent("Paul", grade: 2)

    #expect(school.studentsInGrade(2) == ["Blair", "James", "Paul"])
  }

  @Test("Student not added to multiple grades", .enabled(if: RUNALL))
  func testStudentNotAddedToMultipleGrades() {
    let school = GradeSchool()
    school.addStudent("Blair", grade: 2)
    school.addStudent("James", grade: 2)
    school.addStudent("James", grade: 3)
    school.addStudent("Paul", grade: 3)

    #expect(school.studentsInGrade(2) == ["Blair", "James"])
  }

  @Test("Student not added to other grade for multiple grades", .enabled(if: RUNALL))
  func testStudentNotAddedToOtherGradeForMultipleGrades() {
    let school = GradeSchool()
    school.addStudent("Blair", grade: 2)
    school.addStudent("James", grade: 2)
    school.addStudent("James", grade: 3)
    school.addStudent("Paul", grade: 3)

    #expect(school.studentsInGrade(3) == ["Paul"])
  }

  @Test("Students are sorted by name in a grade", .enabled(if: RUNALL))
  func testStudentsAreSortedByNameInAGrade() {
    let school = GradeSchool()
    school.addStudent("Franklin", grade: 5)
    school.addStudent("Bradley", grade: 5)
    school.addStudent("Jeff", grade: 1)

    #expect(school.studentsInGrade(5) == ["Bradley", "Franklin"])
  }
}
