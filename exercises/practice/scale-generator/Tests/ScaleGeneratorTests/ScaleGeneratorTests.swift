import XCTest

@testable import ScaleGenerator

class ScaleGeneratorTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testChromaticScaleWithSharps() {
    let scaleGenerator = ScaleGenerator(tonic: "C")
    XCTAssertEqual(
      scaleGenerator.chromatic(), ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"])
  }

  func testChromaticScaleWithFlats() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let scaleGenerator = ScaleGenerator(tonic: "F")
    XCTAssertEqual(
      scaleGenerator.chromatic(), ["F", "Gb", "G", "Ab", "A", "Bb", "B", "C", "Db", "D", "Eb", "E"])
  }

  func testSimpleMajorScale() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let scaleGenerator = ScaleGenerator(tonic: "C")
    XCTAssertEqual(scaleGenerator.interval("MMmMMMm"), ["C", "D", "E", "F", "G", "A", "B", "C"])
  }

  func testMajorScaleWithSharps() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let scaleGenerator = ScaleGenerator(tonic: "G")
    XCTAssertEqual(scaleGenerator.interval("MMmMMMm"), ["G", "A", "B", "C", "D", "E", "F#", "G"])
  }

  func testMajorScaleWithFlats() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let scaleGenerator = ScaleGenerator(tonic: "F")
    XCTAssertEqual(scaleGenerator.interval("MMmMMMm"), ["F", "G", "A", "Bb", "C", "D", "E", "F"])
  }

  func testMinorScaleWithSharps() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let scaleGenerator = ScaleGenerator(tonic: "f#")
    XCTAssertEqual(
      scaleGenerator.interval("MmMMmMM"), ["F#", "G#", "A", "B", "C#", "D", "E", "F#"])
  }

  func testMinorScaleWithFlats() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let scaleGenerator = ScaleGenerator(tonic: "bb")
    XCTAssertEqual(
      scaleGenerator.interval("MmMMmMM"), ["Bb", "C", "Db", "Eb", "F", "Gb", "Ab", "Bb"])
  }

  func testDorianMode() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let scaleGenerator = ScaleGenerator(tonic: "d")
    XCTAssertEqual(scaleGenerator.interval("MmMMMmM"), ["D", "E", "F", "G", "A", "B", "C", "D"])
  }

  func testMixolydianMode() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let scaleGenerator = ScaleGenerator(tonic: "Eb")
    XCTAssertEqual(
      scaleGenerator.interval("MMmMMmM"), ["Eb", "F", "G", "Ab", "Bb", "C", "Db", "Eb"])
  }

  func testLydianMode() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let scaleGenerator = ScaleGenerator(tonic: "a")
    XCTAssertEqual(
      scaleGenerator.interval("MMMmMMm"), ["A", "B", "C#", "D#", "E", "F#", "G#", "A"])
  }

  func testPhrygianMode() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let scaleGenerator = ScaleGenerator(tonic: "e")
    XCTAssertEqual(scaleGenerator.interval("mMMMmMM"), ["E", "F", "G", "A", "B", "C", "D", "E"])
  }

  func testLocrianMode() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let scaleGenerator = ScaleGenerator(tonic: "g")
    XCTAssertEqual(
      scaleGenerator.interval("mMMmMMM"), ["G", "Ab", "Bb", "C", "Db", "Eb", "F", "G"])
  }

  func testHarmonicMinor() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let scaleGenerator = ScaleGenerator(tonic: "d")
    XCTAssertEqual(scaleGenerator.interval("MmMMmAm"), ["D", "E", "F", "G", "A", "Bb", "Db", "D"])
  }

  func testOctatonic() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let scaleGenerator = ScaleGenerator(tonic: "C")
    XCTAssertEqual(
      scaleGenerator.interval("MmMmMmMm"), ["C", "D", "D#", "F", "F#", "G#", "A", "B", "C"])
  }

  func testHexatonic() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let scaleGenerator = ScaleGenerator(tonic: "Db")
    XCTAssertEqual(scaleGenerator.interval("MMMMMM"), ["Db", "Eb", "F", "G", "A", "B", "Db"])
  }

  func testPentatonic() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let scaleGenerator = ScaleGenerator(tonic: "A")
    XCTAssertEqual(scaleGenerator.interval("MMAMA"), ["A", "B", "C#", "E", "F#", "A"])
  }

  func testEnigmatic() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let scaleGenerator = ScaleGenerator(tonic: "G")
    XCTAssertEqual(
      scaleGenerator.interval("mAMMMmm"), ["G", "G#", "B", "C#", "D#", "F", "F#", "G"])
  }
}
