import Testing
import Foundation

@testable import CustomSigns

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct CustomSignsTest {
  @Test("Test Birthday") 
  func testBirthday() {
    #expect(birthday == "Birthday")
  }

  @Test("Test Valentine", .enabled(if: RUNALL))
  func testValentine() {
    #expect(valentine == "Valentine's Day")
  }

  @Test("Test Anniversary", .enabled(if: RUNALL))
  func testAnniversary() {
    #expect(anniversary == "Anniversary")
  }

  @Test("Test Space", .enabled(if: RUNALL))
  func testSpace() {
    #expect(space == " " as Character)
  }

  @Test("Test Exclamation", .enabled(if: RUNALL))
  func testExclamation() {
    #expect(exclamation == "!" as Character)
  }

  @Test("Test Build Sign", .enabled(if: RUNALL))
  func testBuildSign() {
    #expect(buildSign(for: valentine, name: "Hikaru") == "Happy Valentine's Day Hikaru!")
  }

  @Test("Test Build Sign with No Name", .enabled(if: RUNALL))
  func testBuildSignNoName() {
    #expect(buildSign(for: birthday, name: "") == "Happy Birthday !")
  }

  @Test("Test Build Sign Anniversary", .enabled(if: RUNALL))
  func testBuildSignAnniversary() {
    #expect(buildSign(for: anniversary, name: "Bob") == "Happy Anniversary Bob!")
  }

  @Test("Test Graduation For", .enabled(if: RUNALL))
  func testGraduationFor() {
    #expect(graduationFor(name: "Isabel", year: 1988) == "Congratulations Isabel!\nClass of 1988")
  }

  @Test("Test Graduation For 2005", .enabled(if: RUNALL))
  func testGraduation2005() {
    #expect(graduationFor(name: "Jeremy", year: 2005) == "Congratulations Jeremy!\nClass of 2005")
  }

  @Test("Test Cost Of Sign", .enabled(if: RUNALL))
  func testCostOfSign() {
    #expect(costOf(sign: graduationFor(name: "Isabel", year: 1988)) == 94)
  }

  @Test("Test Built Sign", .enabled(if: RUNALL))
  func testBuiltSign() {
    #expect(costOf(sign: buildSign(for: anniversary, name: "Bob")) == 64)
  }

  @Test("Test Cost Of Sign Empty", .enabled(if: RUNALL))
  func testCostOfSignEmpty() {
    #expect(costOf(sign: "") == 20)
  }
}
