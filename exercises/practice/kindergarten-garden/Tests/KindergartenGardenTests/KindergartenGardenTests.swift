import Foundation
import Testing

@testable import KindergartenGarden

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "true"]) ?? false

@Suite struct KindergartenGardenTests {

  @Test("garden with single student")
  func testGardenWithSingleStudent() {
    let garden = Garden("RC\nGG")
    #expect(garden.plantsForChild("Alice") == [.radishes, .clover, .grass, .grass])
  }

  @Test("different garden with single student", .enabled(if: RUNALL))
  func testDifferentGardenWithSingleStudent() {
    let garden = Garden("VC\nRC")
    #expect(garden.plantsForChild("Alice") == [.violets, .clover, .radishes, .clover])
  }

  @Test("garden with two students", .enabled(if: RUNALL))
  func testGardenWithTwoStudents() {
    let garden = Garden("VVCG\nVVRC")
    #expect(garden.plantsForChild("Bob") == [.clover, .grass, .radishes, .clover])
  }

  @Test("second student's garden", .enabled(if: RUNALL))
  func testSecondStudentsGarden() {
    let garden = Garden("VVCCGG\nVVCCGG")
    #expect(garden.plantsForChild("Bob") == [.clover, .clover, .clover, .clover])
  }

  @Test("third student's garden", .enabled(if: RUNALL))
  func testThirdStudentsGarden() {
    let garden = Garden("VVCCGG\nVVCCGG")
    #expect(garden.plantsForChild("Charlie") == [.grass, .grass, .grass, .grass])
  }

  @Test("for Alice, first student's garden", .enabled(if: RUNALL))
  func testForAliceFirstStudentsGarden() {
    let garden = Garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    #expect(garden.plantsForChild("Alice") == [.violets, .radishes, .violets, .radishes])
  }

  @Test("for Bob, second student's garden", .enabled(if: RUNALL))
  func testForBobSecondStudentsGarden() {
    let garden = Garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    #expect(garden.plantsForChild("Bob") == [.clover, .grass, .clover, .clover])
  }

  @Test("for Charlie", .enabled(if: RUNALL))
  func testForCharlie() {
    let garden = Garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    #expect(garden.plantsForChild("Charlie") == [.violets, .violets, .clover, .grass])
  }

  @Test("for David", .enabled(if: RUNALL))
  func testForDavid() {
    let garden = Garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    #expect(garden.plantsForChild("David") == [.radishes, .violets, .clover, .radishes])
  }

  @Test("for Eve", .enabled(if: RUNALL))
  func testForEve() {
    let garden = Garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    #expect(garden.plantsForChild("Eve") == [.clover, .grass, .radishes, .grass])
  }

  @Test("for Fred", .enabled(if: RUNALL))
  func testForFred() {
    let garden = Garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    #expect(garden.plantsForChild("Fred") == [.grass, .clover, .violets, .clover])
  }

  @Test("for Ginny", .enabled(if: RUNALL))
  func testForGinny() {
    let garden = Garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    #expect(garden.plantsForChild("Ginny") == [.clover, .grass, .grass, .clover])
  }

  @Test("for Harriet", .enabled(if: RUNALL))
  func testForHarriet() {
    let garden = Garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    #expect(garden.plantsForChild("Harriet") == [.violets, .radishes, .radishes, .violets])
  }

  @Test("for Ileana", .enabled(if: RUNALL))
  func testForIleana() {
    let garden = Garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    #expect(garden.plantsForChild("Ileana") == [.grass, .clover, .violets, .clover])
  }

  @Test("for Joseph", .enabled(if: RUNALL))
  func testForJoseph() {
    let garden = Garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    #expect(garden.plantsForChild("Joseph") == [.violets, .clover, .violets, .grass])
  }

  @Test("for Kincaid, second to last student's garden", .enabled(if: RUNALL))
  func testForKincaidSecondToLastStudentsGarden() {
    let garden = Garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    #expect(garden.plantsForChild("Kincaid") == [.grass, .clover, .clover, .grass])
  }

  @Test("for Larry, last student's garden", .enabled(if: RUNALL))
  func testForLarryLastStudentsGarden() {
    let garden = Garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    #expect(garden.plantsForChild("Larry") == [.grass, .violets, .clover, .violets])
  }
}
