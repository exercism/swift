import Foundation
import Testing

@testable import Raindrops

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct RaindropsTests {

  @Test("the sound for 1 is 1")
  func testTheSoundFor1Is1() {
    #expect(raindrops(1) == "1")
  }

  @Test("the sound for 3 is Pling", .enabled(if: RUNALL))
  func testTheSoundFor3IsPling() {
    #expect(raindrops(3) == "Pling")
  }

  @Test("the sound for 5 is Plang", .enabled(if: RUNALL))
  func testTheSoundFor5IsPlang() {
    #expect(raindrops(5) == "Plang")
  }

  @Test("the sound for 7 is Plong", .enabled(if: RUNALL))
  func testTheSoundFor7IsPlong() {
    #expect(raindrops(7) == "Plong")
  }

  @Test("the sound for 6 is Pling as it has a factor 3", .enabled(if: RUNALL))
  func testTheSoundFor6IsPlingAsItHasAFactor3() {
    #expect(raindrops(6) == "Pling")
  }

  @Test(
    "2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base",
    .enabled(if: RUNALL))
  func test2ToThePower3DoesNotMakeARaindropSoundAs3IsTheExponentNotTheBase() {
    #expect(raindrops(8) == "8")
  }

  @Test("the sound for 9 is Pling as it has a factor 3", .enabled(if: RUNALL))
  func testTheSoundFor9IsPlingAsItHasAFactor3() {
    #expect(raindrops(9) == "Pling")
  }

  @Test("the sound for 10 is Plang as it has a factor 5", .enabled(if: RUNALL))
  func testTheSoundFor10IsPlangAsItHasAFactor5() {
    #expect(raindrops(10) == "Plang")
  }

  @Test("the sound for 14 is Plong as it has a factor of 7", .enabled(if: RUNALL))
  func testTheSoundFor14IsPlongAsItHasAFactorOf7() {
    #expect(raindrops(14) == "Plong")
  }

  @Test("the sound for 15 is PlingPlang as it has factors 3 and 5", .enabled(if: RUNALL))
  func testTheSoundFor15IsPlingplangAsItHasFactors3And5() {
    #expect(raindrops(15) == "PlingPlang")
  }

  @Test("the sound for 21 is PlingPlong as it has factors 3 and 7", .enabled(if: RUNALL))
  func testTheSoundFor21IsPlingplongAsItHasFactors3And7() {
    #expect(raindrops(21) == "PlingPlong")
  }

  @Test("the sound for 25 is Plang as it has a factor 5", .enabled(if: RUNALL))
  func testTheSoundFor25IsPlangAsItHasAFactor5() {
    #expect(raindrops(25) == "Plang")
  }

  @Test("the sound for 27 is Pling as it has a factor 3", .enabled(if: RUNALL))
  func testTheSoundFor27IsPlingAsItHasAFactor3() {
    #expect(raindrops(27) == "Pling")
  }

  @Test("the sound for 35 is PlangPlong as it has factors 5 and 7", .enabled(if: RUNALL))
  func testTheSoundFor35IsPlangplongAsItHasFactors5And7() {
    #expect(raindrops(35) == "PlangPlong")
  }

  @Test("the sound for 49 is Plong as it has a factor 7", .enabled(if: RUNALL))
  func testTheSoundFor49IsPlongAsItHasAFactor7() {
    #expect(raindrops(49) == "Plong")
  }

  @Test("the sound for 52 is 52", .enabled(if: RUNALL))
  func testTheSoundFor52Is52() {
    #expect(raindrops(52) == "52")
  }

  @Test("the sound for 105 is PlingPlangPlong as it has factors 3, 5 and 7", .enabled(if: RUNALL))
  func testTheSoundFor105IsPlingplangplongAsItHasFactors35And7() {
    #expect(raindrops(105) == "PlingPlangPlong")
  }

  @Test("the sound for 3125 is Plang as it has a factor 5", .enabled(if: RUNALL))
  func testTheSoundFor3125IsPlangAsItHasAFactor5() {
    #expect(raindrops(3125) == "Plang")
  }
}
