import Foundation
import Testing

@testable import SecretAgent

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct SecretAgentTests {
  let protected = protectSecret(
    "UMBRA will fill everyone's sugar bowls with salt!", withPassword: "P455w0rd")

  @Test("password success")
  func testPasswordSuccess() {
    #expect(protected("P455w0rd") == "UMBRA will fill everyone's sugar bowls with salt!")
  }

  @Test("password fail", .enabled(if: RUNALL))
  func testPasswordFail() {
    #expect(protected("hunter2") == "Sorry. No hidden secrets here.")
  }

  @Test("combination 1", .enabled(if: RUNALL))
  func testCombination1() {
    let combo = generateCombination(forRoom: 1, usingFunction: { ($0 * 127 + 19) % 256 })
    #expect(combo == (146, 129, 18))
  }

  @Test("combination 2", .enabled(if: RUNALL))
  func testCombination2() {
    let combo = generateCombination(forRoom: 1, usingFunction: { ($0 * 73 + 161) % 256 })
    #expect(combo == (234, 91, 148))
  }
}
