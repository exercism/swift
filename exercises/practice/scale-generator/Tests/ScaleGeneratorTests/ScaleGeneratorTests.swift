import Foundation
import Testing

@testable import ScaleGenerator

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct ScaleGeneratorTests {

  @Test("Chromatic scale with sharps")
  func testChromaticScaleWithSharps() {
    let scaleGenerator = ScaleGenerator(tonic: "C")
    #expect(
      scaleGenerator.chromatic() == [
        "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B",
      ])
  }

  @Test("Chromatic scale with flats", .enabled(if: RUNALL))
  func testChromaticScaleWithFlats() {
    let scaleGenerator = ScaleGenerator(tonic: "F")
    #expect(
      scaleGenerator.chromatic() == [
        "F", "Gb", "G", "Ab", "A", "Bb", "B", "C", "Db", "D", "Eb", "E",
      ])
  }

  @Test("Simple major scale", .enabled(if: RUNALL))
  func testSimpleMajorScale() {
    let scaleGenerator = ScaleGenerator(tonic: "C")
    #expect(scaleGenerator.interval("MMmMMMm") == ["C", "D", "E", "F", "G", "A", "B", "C"])
  }

  @Test("Major scale with sharps", .enabled(if: RUNALL))
  func testMajorScaleWithSharps() {
    let scaleGenerator = ScaleGenerator(tonic: "G")
    #expect(scaleGenerator.interval("MMmMMMm") == ["G", "A", "B", "C", "D", "E", "F#", "G"])
  }

  @Test("Major scale with flats", .enabled(if: RUNALL))
  func testMajorScaleWithFlats() {
    let scaleGenerator = ScaleGenerator(tonic: "F")
    #expect(scaleGenerator.interval("MMmMMMm") == ["F", "G", "A", "Bb", "C", "D", "E", "F"])
  }

  @Test("Minor scale with sharps", .enabled(if: RUNALL))
  func testMinorScaleWithSharps() {
    let scaleGenerator = ScaleGenerator(tonic: "f#")
    #expect(scaleGenerator.interval("MmMMmMM") == ["F#", "G#", "A", "B", "C#", "D", "E", "F#"])
  }

  @Test("Minor scale with flats", .enabled(if: RUNALL))
  func testMinorScaleWithFlats() {
    let scaleGenerator = ScaleGenerator(tonic: "bb")
    #expect(scaleGenerator.interval("MmMMmMM") == ["Bb", "C", "Db", "Eb", "F", "Gb", "Ab", "Bb"])
  }

  @Test("Dorian mode", .enabled(if: RUNALL))
  func testDorianMode() {
    let scaleGenerator = ScaleGenerator(tonic: "d")
    #expect(scaleGenerator.interval("MmMMMmM") == ["D", "E", "F", "G", "A", "B", "C", "D"])
  }

  @Test("Mixolydian mode", .enabled(if: RUNALL))
  func testMixolydianMode() {
    let scaleGenerator = ScaleGenerator(tonic: "Eb")
    #expect(scaleGenerator.interval("MMmMMmM") == ["Eb", "F", "G", "Ab", "Bb", "C", "Db", "Eb"])
  }

  @Test("Lydian mode", .enabled(if: RUNALL))
  func testLydianMode() {
    let scaleGenerator = ScaleGenerator(tonic: "a")
    #expect(scaleGenerator.interval("MMMmMMm") == ["A", "B", "C#", "D#", "E", "F#", "G#", "A"])
  }

  @Test("Phrygian mode", .enabled(if: RUNALL))
  func testPhrygianMode() {
    let scaleGenerator = ScaleGenerator(tonic: "e")
    #expect(scaleGenerator.interval("mMMMmMM") == ["E", "F", "G", "A", "B", "C", "D", "E"])
  }

  @Test("Locrian mode", .enabled(if: RUNALL))
  func testLocrianMode() {
    let scaleGenerator = ScaleGenerator(tonic: "g")
    #expect(scaleGenerator.interval("mMMmMMM") == ["G", "Ab", "Bb", "C", "Db", "Eb", "F", "G"])
  }

  @Test("Harmonic minor", .enabled(if: RUNALL))
  func testHarmonicMinor() {
    let scaleGenerator = ScaleGenerator(tonic: "d")
    #expect(scaleGenerator.interval("MmMMmAm") == ["D", "E", "F", "G", "A", "Bb", "Db", "D"])
  }

  @Test("Octatonic", .enabled(if: RUNALL))
  func testOctatonic() {
    let scaleGenerator = ScaleGenerator(tonic: "C")
    #expect(
      scaleGenerator.interval("MmMmMmMm") == ["C", "D", "D#", "F", "F#", "G#", "A", "B", "C"])
  }

  @Test("Hexatonic", .enabled(if: RUNALL))
  func testHexatonic() {
    let scaleGenerator = ScaleGenerator(tonic: "Db")
    #expect(scaleGenerator.interval("MMMMMM") == ["Db", "Eb", "F", "G", "A", "B", "Db"])
  }

  @Test("Pentatonic", .enabled(if: RUNALL))
  func testPentatonic() {
    let scaleGenerator = ScaleGenerator(tonic: "A")
    #expect(scaleGenerator.interval("MMAMA") == ["A", "B", "C#", "E", "F#", "A"])
  }

  @Test("Enigmatic", .enabled(if: RUNALL))
  func testEnigmatic() {
    let scaleGenerator = ScaleGenerator(tonic: "G")
    #expect(scaleGenerator.interval("mAMMMmm") == ["G", "G#", "B", "C#", "D#", "F", "F#", "G"])
  }
}
