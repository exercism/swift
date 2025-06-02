import Foundation
import Testing

@testable import Allergies

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct AllergiesTests {

  @Test("not allergic to anything")
  func testNotAllergicToAnything1() {
    let allergies = Allergies(0)
    #expect(!allergies.allergicTo(item: "eggs"))
  }

  @Test("allergic only to eggs", .enabled(if: RUNALL))
  func testAllergicOnlyToEggs1() {
    let allergies = Allergies(1)
    #expect(allergies.allergicTo(item: "eggs"))
  }

  @Test("allergic to eggs and something else", .enabled(if: RUNALL))
  func testAllergicToEggsAndSomethingElse1() {
    let allergies = Allergies(3)
    #expect(allergies.allergicTo(item: "eggs"))
  }

  @Test("allergic to something, but not eggs", .enabled(if: RUNALL))
  func testAllergicToSomethingButNotEggs1() {
    let allergies = Allergies(2)
    #expect(!allergies.allergicTo(item: "eggs"))
  }

  @Test("allergic to everything", .enabled(if: RUNALL))
  func testAllergicToEverything1() {
    let allergies = Allergies(255)
    #expect(allergies.allergicTo(item: "eggs"))
  }

  @Test("not allergic to anything", .enabled(if: RUNALL))
  func testNotAllergicToAnything2() {
    let allergies = Allergies(0)
    #expect(!allergies.allergicTo(item: "peanuts"))
  }

  @Test("allergic only to peanuts", .enabled(if: RUNALL))
  func testAllergicOnlyToPeanuts2() {
    let allergies = Allergies(2)
    #expect(allergies.allergicTo(item: "peanuts"))
  }

  @Test("allergic to peanuts and something else", .enabled(if: RUNALL))
  func testAllergicToPeanutsAndSomethingElse2() {
    let allergies = Allergies(7)
    #expect(allergies.allergicTo(item: "peanuts"))
  }

  @Test("allergic to something, but not peanuts", .enabled(if: RUNALL))
  func testAllergicToSomethingButNotPeanuts2() {
    let allergies = Allergies(5)
    #expect(!allergies.allergicTo(item: "peanuts"))
  }

  @Test("allergic to everything", .enabled(if: RUNALL))
  func testAllergicToEverything2() {
    let allergies = Allergies(255)
    #expect(allergies.allergicTo(item: "peanuts"))
  }

  @Test("not allergic to anything", .enabled(if: RUNALL))
  func testNotAllergicToAnything3() {
    let allergies = Allergies(0)
    #expect(!allergies.allergicTo(item: "shellfish"))
  }

  @Test("allergic only to shellfish", .enabled(if: RUNALL))
  func testAllergicOnlyToShellfish3() {
    let allergies = Allergies(4)
    #expect(allergies.allergicTo(item: "shellfish"))
  }

  @Test("allergic to shellfish and something else", .enabled(if: RUNALL))
  func testAllergicToShellfishAndSomethingElse3() {
    let allergies = Allergies(14)
    #expect(allergies.allergicTo(item: "shellfish"))
  }

  @Test("allergic to something, but not shellfish", .enabled(if: RUNALL))
  func testAllergicToSomethingButNotShellfish3() {
    let allergies = Allergies(10)
    #expect(!allergies.allergicTo(item: "shellfish"))
  }

  @Test("allergic to everything", .enabled(if: RUNALL))
  func testAllergicToEverything3() {
    let allergies = Allergies(255)
    #expect(allergies.allergicTo(item: "shellfish"))
  }

  @Test("not allergic to anything", .enabled(if: RUNALL))
  func testNotAllergicToAnything4() {
    let allergies = Allergies(0)
    #expect(!allergies.allergicTo(item: "strawberries"))
  }

  @Test("allergic only to strawberries", .enabled(if: RUNALL))
  func testAllergicOnlyToStrawberries4() {
    let allergies = Allergies(8)
    #expect(allergies.allergicTo(item: "strawberries"))
  }

  @Test("allergic to strawberries and something else", .enabled(if: RUNALL))
  func testAllergicToStrawberriesAndSomethingElse4() {
    let allergies = Allergies(28)
    #expect(allergies.allergicTo(item: "strawberries"))
  }

  @Test("allergic to something, but not strawberries", .enabled(if: RUNALL))
  func testAllergicToSomethingButNotStrawberries4() {
    let allergies = Allergies(20)
    #expect(!allergies.allergicTo(item: "strawberries"))
  }

  @Test("allergic to everything", .enabled(if: RUNALL))
  func testAllergicToEverything4() {
    let allergies = Allergies(255)
    #expect(allergies.allergicTo(item: "strawberries"))
  }

  @Test("not allergic to anything", .enabled(if: RUNALL))
  func testNotAllergicToAnything5() {
    let allergies = Allergies(0)
    #expect(!allergies.allergicTo(item: "tomatoes"))
  }

  @Test("allergic only to tomatoes", .enabled(if: RUNALL))
  func testAllergicOnlyToTomatoes5() {
    let allergies = Allergies(16)
    #expect(allergies.allergicTo(item: "tomatoes"))
  }

  @Test("allergic to tomatoes and something else", .enabled(if: RUNALL))
  func testAllergicToTomatoesAndSomethingElse5() {
    let allergies = Allergies(56)
    #expect(allergies.allergicTo(item: "tomatoes"))
  }

  @Test("allergic to something, but not tomatoes", .enabled(if: RUNALL))
  func testAllergicToSomethingButNotTomatoes5() {
    let allergies = Allergies(40)
    #expect(!allergies.allergicTo(item: "tomatoes"))
  }

  @Test("allergic to everything", .enabled(if: RUNALL))
  func testAllergicToEverything5() {
    let allergies = Allergies(255)
    #expect(allergies.allergicTo(item: "tomatoes"))
  }

  @Test("not allergic to anything", .enabled(if: RUNALL))
  func testNotAllergicToAnything6() {
    let allergies = Allergies(0)
    #expect(!allergies.allergicTo(item: "chocolate"))
  }

  @Test("allergic only to chocolate", .enabled(if: RUNALL))
  func testAllergicOnlyToChocolate6() {
    let allergies = Allergies(32)
    #expect(allergies.allergicTo(item: "chocolate"))
  }

  @Test("allergic to chocolate and something else", .enabled(if: RUNALL))
  func testAllergicToChocolateAndSomethingElse6() {
    let allergies = Allergies(112)
    #expect(allergies.allergicTo(item: "chocolate"))
  }

  @Test("allergic to something, but not chocolate", .enabled(if: RUNALL))
  func testAllergicToSomethingButNotChocolate6() {
    let allergies = Allergies(80)
    #expect(!allergies.allergicTo(item: "chocolate"))
  }

  @Test("allergic to everything", .enabled(if: RUNALL))
  func testAllergicToEverything6() {
    let allergies = Allergies(255)
    #expect(allergies.allergicTo(item: "chocolate"))
  }

  @Test("not allergic to anything", .enabled(if: RUNALL))
  func testNotAllergicToAnything7() {
    let allergies = Allergies(0)
    #expect(!allergies.allergicTo(item: "pollen"))
  }

  @Test("allergic only to pollen", .enabled(if: RUNALL))
  func testAllergicOnlyToPollen7() {
    let allergies = Allergies(64)
    #expect(allergies.allergicTo(item: "pollen"))
  }

  @Test("allergic to pollen and something else", .enabled(if: RUNALL))
  func testAllergicToPollenAndSomethingElse7() {
    let allergies = Allergies(224)
    #expect(allergies.allergicTo(item: "pollen"))
  }

  @Test("allergic to something, but not pollen", .enabled(if: RUNALL))
  func testAllergicToSomethingButNotPollen7() {
    let allergies = Allergies(160)
    #expect(!allergies.allergicTo(item: "pollen"))
  }

  @Test("allergic to everything", .enabled(if: RUNALL))
  func testAllergicToEverything7() {
    let allergies = Allergies(255)
    #expect(allergies.allergicTo(item: "pollen"))
  }

  @Test("not allergic to anything", .enabled(if: RUNALL))
  func testNotAllergicToAnything8() {
    let allergies = Allergies(0)
    #expect(!allergies.allergicTo(item: "cats"))
  }

  @Test("allergic only to cats", .enabled(if: RUNALL))
  func testAllergicOnlyToCats8() {
    let allergies = Allergies(128)
    #expect(allergies.allergicTo(item: "cats"))
  }

  @Test("allergic to cats and something else", .enabled(if: RUNALL))
  func testAllergicToCatsAndSomethingElse8() {
    let allergies = Allergies(192)
    #expect(allergies.allergicTo(item: "cats"))
  }

  @Test("allergic to something, but not cats", .enabled(if: RUNALL))
  func testAllergicToSomethingButNotCats8() {
    let allergies = Allergies(64)
    #expect(!allergies.allergicTo(item: "cats"))
  }

  @Test("allergic to everything", .enabled(if: RUNALL))
  func testAllergicToEverything8() {
    let allergies = Allergies(255)
    #expect(allergies.allergicTo(item: "cats"))
  }

  @Test("no allergies", .enabled(if: RUNALL))
  func testNoAllergies9() {
    let allergies = Allergies(0)
  }

  @Test("just eggs", .enabled(if: RUNALL))
  func testJustEggs9() {
    let allergies = Allergies(1)
    #expect(allergies.list() == ["eggs"])
  }

  @Test("just peanuts", .enabled(if: RUNALL))
  func testJustPeanuts9() {
    let allergies = Allergies(2)
    #expect(allergies.list() == ["peanuts"])
  }

  @Test("just strawberries", .enabled(if: RUNALL))
  func testJustStrawberries9() {
    let allergies = Allergies(8)
    #expect(allergies.list() == ["strawberries"])
  }

  @Test("eggs and peanuts", .enabled(if: RUNALL))
  func testEggsAndPeanuts9() {
    let allergies = Allergies(3)
    #expect(allergies.list() == ["eggs", "peanuts"])
  }

  @Test("more than eggs but not peanuts", .enabled(if: RUNALL))
  func testMoreThanEggsButNotPeanuts9() {
    let allergies = Allergies(5)
    #expect(allergies.list() == ["eggs", "shellfish"])
  }

  @Test("lots of stuff", .enabled(if: RUNALL))
  func testLotsOfStuff9() {
    let allergies = Allergies(248)
    #expect(allergies.list() == ["strawberries", "tomatoes", "chocolate", "pollen", "cats"])
  }

  @Test("everything", .enabled(if: RUNALL))
  func testEverything9() {
    let allergies = Allergies(255)
    #expect(
      allergies.list() == [
        "eggs", "peanuts", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats",
      ])
  }

  @Test("no allergen score parts", .enabled(if: RUNALL))
  func testNoAllergenScoreParts9() {
    let allergies = Allergies(509)
    #expect(
      allergies.list() == [
        "eggs", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats",
      ])
  }

  @Test("no allergen score parts without highest valid score", .enabled(if: RUNALL))
  func testNoAllergenScorePartsWithoutHighestValidScore9() {
    let allergies = Allergies(257)
    #expect(allergies.list() == ["eggs"])
  }
}
