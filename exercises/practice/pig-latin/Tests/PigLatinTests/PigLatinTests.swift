import Foundation
import Testing

@testable import PigLatin

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct PigLatinTests {

  @Test("word beginning with a")
  func testWordBeginningWithA() {
    #expect(PigLatin.translate("apple") == "appleay")
  }

  @Test("word beginning with e", .enabled(if: RUNALL))
  func testWordBeginningWithE() {
    #expect(PigLatin.translate("ear") == "earay")
  }

  @Test("word beginning with i", .enabled(if: RUNALL))
  func testWordBeginningWithI() {
    #expect(PigLatin.translate("igloo") == "iglooay")
  }

  @Test("word beginning with o", .enabled(if: RUNALL))
  func testWordBeginningWithO() {
    #expect(PigLatin.translate("object") == "objectay")
  }

  @Test("word beginning with u", .enabled(if: RUNALL))
  func testWordBeginningWithU() {
    #expect(PigLatin.translate("under") == "underay")
  }

  @Test("word beginning with a vowel and followed by a qu", .enabled(if: RUNALL))
  func testWordBeginningWithAVowelAndFollowedByAQu() {
    #expect(PigLatin.translate("equal") == "equalay")
  }

  @Test("word beginning with p", .enabled(if: RUNALL))
  func testWordBeginningWithP() {
    #expect(PigLatin.translate("pig") == "igpay")
  }

  @Test("word beginning with k", .enabled(if: RUNALL))
  func testWordBeginningWithK() {
    #expect(PigLatin.translate("koala") == "oalakay")
  }

  @Test("word beginning with x", .enabled(if: RUNALL))
  func testWordBeginningWithX() {
    #expect(PigLatin.translate("xenon") == "enonxay")
  }

  @Test("word beginning with q without a following u", .enabled(if: RUNALL))
  func testWordBeginningWithQWithoutAFollowingU() {
    #expect(PigLatin.translate("qat") == "atqay")
  }

  @Test("word beginning with consonant and vowel containing qu", .enabled(if: RUNALL))
  func testWordBeginningWithConsonantAndVowelContainingQu() {
    #expect(PigLatin.translate("liquid") == "iquidlay")
  }

  @Test("word beginning with ch", .enabled(if: RUNALL))
  func testWordBeginningWithCh() {
    #expect(PigLatin.translate("chair") == "airchay")
  }

  @Test("word beginning with qu", .enabled(if: RUNALL))
  func testWordBeginningWithQu() {
    #expect(PigLatin.translate("queen") == "eenquay")
  }

  @Test("word beginning with qu and a preceding consonant", .enabled(if: RUNALL))
  func testWordBeginningWithQuAndAPrecedingConsonant() {
    #expect(PigLatin.translate("square") == "aresquay")
  }

  @Test("word beginning with th", .enabled(if: RUNALL))
  func testWordBeginningWithTh() {
    #expect(PigLatin.translate("therapy") == "erapythay")
  }

  @Test("word beginning with thr", .enabled(if: RUNALL))
  func testWordBeginningWithThr() {
    #expect(PigLatin.translate("thrush") == "ushthray")
  }

  @Test("word beginning with sch", .enabled(if: RUNALL))
  func testWordBeginningWithSch() {
    #expect(PigLatin.translate("school") == "oolschay")
  }

  @Test("word beginning with yt", .enabled(if: RUNALL))
  func testWordBeginningWithYt() {
    #expect(PigLatin.translate("yttria") == "yttriaay")
  }

  @Test("word beginning with xr", .enabled(if: RUNALL))
  func testWordBeginningWithXr() {
    #expect(PigLatin.translate("xray") == "xrayay")
  }

  @Test("y is treated like a consonant at the beginning of a word", .enabled(if: RUNALL))
  func testYIsTreatedLikeAConsonantAtTheBeginningOfAWord() {
    #expect(PigLatin.translate("yellow") == "ellowyay")
  }

  @Test("y is treated like a vowel at the end of a consonant cluster", .enabled(if: RUNALL))
  func testYIsTreatedLikeAVowelAtTheEndOfAConsonantCluster() {
    #expect(PigLatin.translate("rhythm") == "ythmrhay")
  }

  @Test("y as second letter in two letter word", .enabled(if: RUNALL))
  func testYAsSecondLetterInTwoLetterWord() {
    #expect(PigLatin.translate("my") == "ymay")
  }

  @Test("a whole phrase", .enabled(if: RUNALL))
  func testAWholePhrase() {
    #expect(PigLatin.translate("quick fast run") == "ickquay astfay unray")
  }
}
