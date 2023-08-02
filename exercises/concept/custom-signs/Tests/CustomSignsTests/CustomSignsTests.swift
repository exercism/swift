import XCTest

@testable import CustomSigns

let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

class TaskStringConstants: XCTestCase {
  func testBirthday() {
    XCTAssertEqual(birthday, "Birthday")
  }

  func testValentine() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(valentine, "Valentine's Day")
  }

  func testAnniversary() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(anniversary, "Anniversary")
  }
}

class TaskCharacterConstants: XCTestCase {
  func testSpace() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(space, " " as Character)
  }

  func testExclamation() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(exclamation, "!" as Character)
  }
}

class TaskBuildSign: XCTestCase {
  func testBuildSign() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(buildSign(for: valentine, name: "Hikaru"), "Happy Valentine's Day Hikaru!")
  }

  func testBuildSignNoName() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(buildSign(for: birthday, name: ""), "Happy Birthday !")
  }

  func testBuildSignAnniversary() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(buildSign(for: anniversary, name: "Bob"), "Happy Anniversary Bob!")
  }
}

class TaskGraduationFor: XCTestCase {
  func testGraduation() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      graduationFor(name: "Isabel", year: 1988), "Congratulations Isabel!\nClass of 1988")
  }

  func testGraduation2005() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      graduationFor(name: "Jeremy", year: 2005), "Congratulations Jeremy!\nClass of 2005")
  }
}

class TaskCostOf: XCTestCase {
  func testCostOfSign() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(costOf(sign: graduationFor(name: "Isabel", year: 1988)), 94)
  }

  func testBuiltSign() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(costOf(sign: buildSign(for: anniversary, name: "Bob")), 64)
  }

  func testCostOfSignEmpty() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(costOf(sign: ""), 20)
  }
}
