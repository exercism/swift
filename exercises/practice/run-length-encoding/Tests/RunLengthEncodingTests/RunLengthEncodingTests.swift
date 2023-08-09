import XCTest

@testable import RunLengthEncoding

class RunLengthEncodingTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testEncodeEmptyString() {
    XCTAssertEqual(RunLengthEncoding.encode(""), "")
  }

  func testEncodeSingleCharactersOnlyAreEncodedWithoutCount() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(RunLengthEncoding.encode("XYZ"), "XYZ")
  }

  func testEncodeStringWithNoSingleCharacters() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(RunLengthEncoding.encode("AABBBCCCC"), "2A3B4C")
  }

  func testEncodeSingleCharactersMixedWithRepeatedCharacters() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      RunLengthEncoding.encode("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"),
      "12WB12W3B24WB")
  }

  func testEncodeMultipleWhitespaceMixedInString() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(RunLengthEncoding.encode("  hsqq qww  "), "2 hs2q q2w2 ")
  }

  func testEncodeLowercaseCharacters() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(RunLengthEncoding.encode("aabbbcccc"), "2a3b4c")
  }

  func testDecodeEmptyString() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(RunLengthEncoding.decode(""), "")
  }

  func testDecodeSingleCharactersOnly() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(RunLengthEncoding.decode("XYZ"), "XYZ")
  }

  func testDecodeStringWithNoSingleCharacters() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(RunLengthEncoding.decode("2A3B4C"), "AABBBCCCC")
  }

  func testDecodeSingleCharactersWithRepeatedCharacters() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      RunLengthEncoding.decode("12WB12W3B24WB"),
      "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB")
  }

  func testDecodeMultipleWhitespaceMixedInString() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(RunLengthEncoding.decode("2 hs2q q2w2 "), "  hsqq qww  ")
  }

  func testDecodeLowercaseString() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(RunLengthEncoding.decode("2a3b4c"), "aabbbcccc")
  }

  func testConsistencyEncodeFollowedByDecodeGivesOriginalString() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let encoded = RunLengthEncoding.encode("zzz ZZ  zZ")
    let decoded = RunLengthEncoding.decode(encoded)
    XCTAssertEqual(decoded, "zzz ZZ  zZ")
  }
}
