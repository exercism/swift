import XCTest
@testable import ScaleGenerator

class ScaleGeneratorTests: XCTestCase {

    func testNamingScale() {
        let chromatic = ScaleGenerator(tonic: "c", scaleName: "chromatic")
        XCTAssertEqual(chromatic.name, "C chromatic")
    }

    func testChromaticScale() {
        let chromatic = ScaleGenerator(tonic: "C", scaleName: "chromatic")
        XCTAssertEqual(chromatic.pitches(), ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"])
    }

    func testAnotherChromaticScale() {
        let chromatic = ScaleGenerator(tonic: "F", scaleName: "chromatic")
        XCTAssertEqual(chromatic.pitches(), ["F", "Gb", "G", "Ab", "A", "Bb", "B", "C", "Db", "D", "Eb", "E"])
    }

    func testNamingMajorScale() {
        let major = ScaleGenerator(tonic: "G", scaleName: "major", pattern: "MMmMMMm")
        XCTAssertEqual(major.name, "G major")
    }

    func testMajorScale() {
        let major = ScaleGenerator(tonic: "C", scaleName: "major", pattern: "MMmMMMm")
        XCTAssertEqual(major.pitches(), ["C", "D", "E", "F", "G", "A", "B"])
    }

    func testAnotherMajorScale() {
        let major = ScaleGenerator(tonic: "G", scaleName: "major", pattern: "MMmMMMm")
        XCTAssertEqual(major.pitches(), ["G", "A", "B", "C", "D", "E", "F#"])
    }

    func testMinorScale() {
        let minor = ScaleGenerator(tonic: "f#", scaleName: "minor", pattern: "MmMMmMM")
        XCTAssertEqual(minor.pitches(), ["F#", "G#", "A", "B", "C#", "D", "E"])
    }

    func testAnotherMinorScale() {
        let minor = ScaleGenerator(tonic: "bb", scaleName: "minor", pattern: "MmMMmMM")
        XCTAssertEqual(minor.pitches(), ["Bb", "C", "Db", "Eb", "F", "Gb", "Ab"])
    }

    func testDorianMode() {
        let dorian = ScaleGenerator(tonic: "d", scaleName: "dorian", pattern: "MmMMMmM")
        XCTAssertEqual(dorian.pitches(), ["D", "E", "F", "G", "A", "B", "C"])
    }

    func testMixolydianMode() {
        let mixolydian = ScaleGenerator(tonic: "Eb", scaleName: "mixolydian", pattern: "MMmMMmM")
        XCTAssertEqual(mixolydian.pitches(), ["Eb", "F", "G", "Ab", "Bb", "C", "Db"])
    }

    func testLydianMode() {
        let lydian = ScaleGenerator(tonic: "a", scaleName: "lydian", pattern: "MMMmMMm")
        XCTAssertEqual(lydian.pitches(), ["A", "B", "C#", "D#", "E", "F#", "G#"])
    }

    func testPhrygianMode() {
        let phrygian = ScaleGenerator(tonic: "e", scaleName: "phrygian", pattern: "mMMMmMM")
        XCTAssertEqual(phrygian.pitches(), ["E", "F", "G", "A", "B", "C", "D"])
    }

    func testLocrianMode() {
        let locrian = ScaleGenerator(tonic: "g", scaleName: "locrian", pattern: "mMMmMMM")
        XCTAssertEqual(locrian.pitches(), ["G", "Ab", "Bb", "C", "Db", "Eb", "F"])
    }

    func testHarmonicMinor() {
        let harmonicMinor = ScaleGenerator(tonic: "d", scaleName: "harmonic minor", pattern: "MmMMmAm")
        XCTAssertEqual(harmonicMinor.pitches(), ["D", "E", "F", "G", "A", "Bb", "Db"])
    }

    func testOctatonic() {
        let octatonic = ScaleGenerator(tonic: "C", scaleName: "octatonic", pattern: "MmMmMmMm")
        XCTAssertEqual(octatonic.pitches(), ["C", "D", "D#", "F", "F#", "G#", "A", "B"])
    }

    func testHexatonic() {
        let hexatonic = ScaleGenerator(tonic: "Db", scaleName: "hexatonic", pattern: "MMMMMM")
        XCTAssertEqual(hexatonic.pitches(), ["Db", "Eb", "F", "G", "A", "B"])
    }

    func testPentatonic() {
        let pentatonic = ScaleGenerator(tonic: "A", scaleName: "pentatonic", pattern: "MMAMA")
        XCTAssertEqual(pentatonic.pitches(), ["A", "B", "C#", "E", "F#"])
    }

    func testEnigmatic() {
        let enigmatic = ScaleGenerator(tonic: "G", scaleName: "enigma", pattern: "mAMMMmm")
        XCTAssertEqual(enigmatic.pitches(), ["G", "G#", "B", "C#", "D#", "F", "F#"])
    }

    static var allTests: [(String, (ScaleGeneratorTests) -> () throws -> Void)] {
        return [
            ("testNamingScale", testNamingScale),
            ("testChromaticScale", testChromaticScale),
            ("testAnotherChromaticScale", testAnotherChromaticScale),
            ("testNamingMajorScale", testNamingMajorScale),
            ("testMajorScale", testMajorScale),
            ("testAnotherMajorScale", testAnotherMajorScale),
            ("testDorianMode", testDorianMode),
            ("testMixolydianMode", testMixolydianMode),
            ("testLydianMode", testLydianMode),
            ("testPhrygianMode", testPhrygianMode),
            ("testLocrianMode", testLocrianMode),
            ("testHarmonicMinor", testHarmonicMinor),
            ("testOctatonic", testOctatonic),
            ("testHexatonic", testHexatonic),
            ("testPentatonic", testPentatonic),
            ("testEnigmatic", testEnigmatic)
        ]
    }
}
