#if swift(>=3.0)
    import XCTest
#endif

class RunLengthEncodingTest: XCTestCase {

    func testEncodeSimple() {
        XCTAssertEqual(RunLengthEncoding.encode("AABBBCCCC"), "2A3B4C")
    }

    func testDecodeSimple() {
        XCTAssertEqual(RunLengthEncoding.decode("2A3B4C"), "AABBBCCCC")
    }

    func testEncodeWithSingleValues() {
        XCTAssertEqual(RunLengthEncoding.encode("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"), "12WB12W3B24WB")
    }

    func testDecodeWithSingleValues() {
        XCTAssertEqual(RunLengthEncoding.decode("12WB12W3B24WB"), "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB")
    }

    func testDecodeEncodeCombination() {
        XCTAssertEqual(RunLengthEncoding.decode(RunLengthEncoding.encode("zzz ZZ  zZ")), "zzz ZZ  zZ")
    }

    func testEncodeUnicode() {
        XCTAssertEqual(RunLengthEncoding.encode("⏰⚽⚽⚽⭐⭐⏰"), "⏰3⚽2⭐⏰")
    }

    func testDecodeUnicode() {
        XCTAssertEqual(RunLengthEncoding.decode("⏰3⚽2⭐⏰"), "⏰⚽⚽⚽⭐⭐⏰")
    }
}
