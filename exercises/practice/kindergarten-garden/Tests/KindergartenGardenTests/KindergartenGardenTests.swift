import XCTest

@testable import KindergartenGarden

class KindergartenGardenTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testGardenWithSingleStudent() {
    let garden = Garden("RC\nGG")
    XCTAssertEqual(garden.plantsForChild("Alice"), [.radishes, .clover, .grass, .grass])
  }

  func testDifferentGardenWithSingleStudent() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let garden = Garden("VC\nRC")
    XCTAssertEqual(garden.plantsForChild("Alice"), [.violets, .clover, .radishes, .clover])
  }

  func testGardenWithTwoStudents() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let garden = Garden("VVCG\nVVRC")
    XCTAssertEqual(garden.plantsForChild("Bob"), [.clover, .grass, .radishes, .clover])
  }

  func testSecondStudentsGarden() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let garden = Garden("VVCCGG\nVVCCGG")
    XCTAssertEqual(garden.plantsForChild("Bob"), [.clover, .clover, .clover, .clover])
  }

  func testThirdStudentsGarden() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let garden = Garden("VVCCGG\nVVCCGG")
    XCTAssertEqual(garden.plantsForChild("Charlie"), [.grass, .grass, .grass, .grass])
  }

  func testForAliceFirstStudentsGarden() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let garden = Garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    XCTAssertEqual(garden.plantsForChild("Alice"), [.violets, .radishes, .violets, .radishes])
  }

  func testForBobSecondStudentsGarden() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let garden = Garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    XCTAssertEqual(garden.plantsForChild("Bob"), [.clover, .grass, .clover, .clover])
  }

  func testForCharlie() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let garden = Garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    XCTAssertEqual(garden.plantsForChild("Charlie"), [.violets, .violets, .clover, .grass])
  }

  func testForDavid() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let garden = Garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    XCTAssertEqual(garden.plantsForChild("David"), [.radishes, .violets, .clover, .radishes])
  }

  func testForEve() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let garden = Garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    XCTAssertEqual(garden.plantsForChild("Eve"), [.clover, .grass, .radishes, .grass])
  }

  func testForFred() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let garden = Garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    XCTAssertEqual(garden.plantsForChild("Fred"), [.grass, .clover, .violets, .clover])
  }

  func testForGinny() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let garden = Garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    XCTAssertEqual(garden.plantsForChild("Ginny"), [.clover, .grass, .grass, .clover])
  }

  func testForHarriet() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let garden = Garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    XCTAssertEqual(garden.plantsForChild("Harriet"), [.violets, .radishes, .radishes, .violets])
  }

  func testForIleana() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let garden = Garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    XCTAssertEqual(garden.plantsForChild("Ileana"), [.grass, .clover, .violets, .clover])
  }

  func testForJoseph() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let garden = Garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    XCTAssertEqual(garden.plantsForChild("Joseph"), [.violets, .clover, .violets, .grass])
  }

  func testForKincaidSecondToLastStudentsGarden() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let garden = Garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    XCTAssertEqual(garden.plantsForChild("Kincaid"), [.grass, .clover, .clover, .grass])
  }

  func testForLarryLastStudentsGarden() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let garden = Garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    XCTAssertEqual(garden.plantsForChild("Larry"), [.grass, .violets, .clover, .violets])
  }
}
