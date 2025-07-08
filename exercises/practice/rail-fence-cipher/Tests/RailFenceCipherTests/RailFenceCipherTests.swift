import Foundation
import Testing

@testable import RailFenceCipher

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct RailFenceCipherTests {

  @Test("encode with two rails")
  func testEncodeWithTwoRails() {
    #expect(encode("XOXOXOXOXOXOXOXOXO", rails: 2) == "XXXXXXXXXOOOOOOOOO")
  }

  @Test("encode with three rails", .enabled(if: RUNALL))
  func testEncodeWithThreeRails() {
    #expect(encode("WEAREDISCOVEREDFLEEATONCE", rails: 3) == "WECRLTEERDSOEEFEAOCAIVDEN")
  }

  @Test("encode with ending in the middle", .enabled(if: RUNALL))
  func testEncodeWithEndingInTheMiddle() {
    #expect(encode("EXERCISES", rails: 4) == "ESXIEECSR")
  }

  @Test("decode with three rails", .enabled(if: RUNALL))
  func testDecodeWithThreeRails() {
    #expect(decode("TEITELHDVLSNHDTISEIIEA", rails: 3) == "THEDEVILISINTHEDETAILS")
  }

  @Test("decode with five rails", .enabled(if: RUNALL))
  func testDecodeWithFiveRails() {
    #expect(decode("EIEXMSMESAORIWSCE", rails: 5) == "EXERCISMISAWESOME")
  }

  @Test("decode with six rails", .enabled(if: RUNALL))
  func testDecodeWithSixRails() {
    #expect(
      decode("133714114238148966225439541018335470986172518171757571896261", rails: 6)
        == "112358132134558914423337761098715972584418167651094617711286")
  }

}
