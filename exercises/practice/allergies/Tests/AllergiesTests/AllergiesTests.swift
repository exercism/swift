import XCTest

@testable import Allergies

class AllergiesTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testNotAllergicToAnything1() {
    let allergies = Allergies(0)
    XCTAssertFalse(allergies.allergicTo(item: "eggs"))
  }

  func testAllergicOnlyToEggs1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(1)
    XCTAssertTrue(allergies.allergicTo(item: "eggs"))
  }

  func testAllergicToEggsAndSomethingElse1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(3)
    XCTAssertTrue(allergies.allergicTo(item: "eggs"))
  }

  func testAllergicToSomethingButNotEggs1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(2)
    XCTAssertFalse(allergies.allergicTo(item: "eggs"))
  }

  func testAllergicToEverything1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(255)
    XCTAssertTrue(allergies.allergicTo(item: "eggs"))
  }

  func testNotAllergicToAnything2() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(0)
    XCTAssertFalse(allergies.allergicTo(item: "peanuts"))
  }

  func testAllergicOnlyToPeanuts2() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(2)
    XCTAssertTrue(allergies.allergicTo(item: "peanuts"))
  }

  func testAllergicToPeanutsAndSomethingElse2() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(7)
    XCTAssertTrue(allergies.allergicTo(item: "peanuts"))
  }

  func testAllergicToSomethingButNotPeanuts2() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(5)
    XCTAssertFalse(allergies.allergicTo(item: "peanuts"))
  }

  func testAllergicToEverything2() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(255)
    XCTAssertTrue(allergies.allergicTo(item: "peanuts"))
  }

  func testNotAllergicToAnything3() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(0)
    XCTAssertFalse(allergies.allergicTo(item: "shellfish"))
  }

  func testAllergicOnlyToShellfish3() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(4)
    XCTAssertTrue(allergies.allergicTo(item: "shellfish"))
  }

  func testAllergicToShellfishAndSomethingElse3() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(14)
    XCTAssertTrue(allergies.allergicTo(item: "shellfish"))
  }

  func testAllergicToSomethingButNotShellfish3() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(10)
    XCTAssertFalse(allergies.allergicTo(item: "shellfish"))
  }

  func testAllergicToEverything3() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(255)
    XCTAssertTrue(allergies.allergicTo(item: "shellfish"))
  }

  func testNotAllergicToAnything4() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(0)
    XCTAssertFalse(allergies.allergicTo(item: "strawberries"))
  }

  func testAllergicOnlyToStrawberries4() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(8)
    XCTAssertTrue(allergies.allergicTo(item: "strawberries"))
  }

  func testAllergicToStrawberriesAndSomethingElse4() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(28)
    XCTAssertTrue(allergies.allergicTo(item: "strawberries"))
  }

  func testAllergicToSomethingButNotStrawberries4() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(20)
    XCTAssertFalse(allergies.allergicTo(item: "strawberries"))
  }

  func testAllergicToEverything4() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(255)
    XCTAssertTrue(allergies.allergicTo(item: "strawberries"))
  }

  func testNotAllergicToAnything5() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(0)
    XCTAssertFalse(allergies.allergicTo(item: "tomatoes"))
  }

  func testAllergicOnlyToTomatoes5() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(16)
    XCTAssertTrue(allergies.allergicTo(item: "tomatoes"))
  }

  func testAllergicToTomatoesAndSomethingElse5() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(56)
    XCTAssertTrue(allergies.allergicTo(item: "tomatoes"))
  }

  func testAllergicToSomethingButNotTomatoes5() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(40)
    XCTAssertFalse(allergies.allergicTo(item: "tomatoes"))
  }

  func testAllergicToEverything5() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(255)
    XCTAssertTrue(allergies.allergicTo(item: "tomatoes"))
  }

  func testNotAllergicToAnything6() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(0)
    XCTAssertFalse(allergies.allergicTo(item: "chocolate"))
  }

  func testAllergicOnlyToChocolate6() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(32)
    XCTAssertTrue(allergies.allergicTo(item: "chocolate"))
  }

  func testAllergicToChocolateAndSomethingElse6() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(112)
    XCTAssertTrue(allergies.allergicTo(item: "chocolate"))
  }

  func testAllergicToSomethingButNotChocolate6() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(80)
    XCTAssertFalse(allergies.allergicTo(item: "chocolate"))
  }

  func testAllergicToEverything6() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(255)
    XCTAssertTrue(allergies.allergicTo(item: "chocolate"))
  }

  func testNotAllergicToAnything7() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(0)
    XCTAssertFalse(allergies.allergicTo(item: "pollen"))
  }

  func testAllergicOnlyToPollen7() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(64)
    XCTAssertTrue(allergies.allergicTo(item: "pollen"))
  }

  func testAllergicToPollenAndSomethingElse7() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(224)
    XCTAssertTrue(allergies.allergicTo(item: "pollen"))
  }

  func testAllergicToSomethingButNotPollen7() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(160)
    XCTAssertFalse(allergies.allergicTo(item: "pollen"))
  }

  func testAllergicToEverything7() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(255)
    XCTAssertTrue(allergies.allergicTo(item: "pollen"))
  }

  func testNotAllergicToAnything8() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(0)
    XCTAssertFalse(allergies.allergicTo(item: "cats"))
  }

  func testAllergicOnlyToCats8() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(128)
    XCTAssertTrue(allergies.allergicTo(item: "cats"))
  }

  func testAllergicToCatsAndSomethingElse8() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(192)
    XCTAssertTrue(allergies.allergicTo(item: "cats"))
  }

  func testAllergicToSomethingButNotCats8() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(64)
    XCTAssertFalse(allergies.allergicTo(item: "cats"))
  }

  func testAllergicToEverything8() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(255)
    XCTAssertTrue(allergies.allergicTo(item: "cats"))
  }

  func testNoAllergies9() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(0)
    XCTAssertEqual(allergies.list(), [])
  }

  func testJustEggs9() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(1)
    XCTAssertEqual(allergies.list(), ["eggs"])
  }

  func testJustPeanuts9() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(2)
    XCTAssertEqual(allergies.list(), ["peanuts"])
  }

  func testJustStrawberries9() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(8)
    XCTAssertEqual(allergies.list(), ["strawberries"])
  }

  func testEggsAndPeanuts9() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(3)
    XCTAssertEqual(allergies.list(), ["eggs", "peanuts"])
  }

  func testMoreThanEggsButNotPeanuts9() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(5)
    XCTAssertEqual(allergies.list(), ["eggs", "shellfish"])
  }

  func testLotsOfStuff9() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(248)
    XCTAssertEqual(allergies.list(), ["strawberries", "tomatoes", "chocolate", "pollen", "cats"])
  }

  func testEverything9() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(255)
    XCTAssertEqual(
      allergies.list(),
      ["eggs", "peanuts", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats"])
  }

  func testNoAllergenScoreParts9() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(509)
    XCTAssertEqual(
      allergies.list(),
      ["eggs", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats"])
  }

  func testNoAllergenScorePartsWithoutHighestValidScore9() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let allergies = Allergies(257)
    XCTAssertEqual(allergies.list(), ["eggs"])
  }
}
