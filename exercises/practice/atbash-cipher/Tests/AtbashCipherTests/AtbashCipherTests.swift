import XCTest

@testable import AtbashCipher

class AtbashCipherTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testEncodeYes() {
    XCTAssertEqual("bvh", AtbashCipher.encode("yes"))
  }

  func testEncodeNo() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("ml", AtbashCipher.encode("no"))
  }

  func testEncodeOmg() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("lnt", AtbashCipher.encode("OMG"))
  }

  func testEncodeSpaces() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("lnt", AtbashCipher.encode("O M G"))
  }

  func testEncodeMindblowingly() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("nrmwy oldrm tob", AtbashCipher.encode("mindblowingly"))
  }

  func testEncodeNumbers() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("gvhgr mt123 gvhgr mt", AtbashCipher.encode("Testing,1 2 3, testing."))
  }

  func testEncodeDeepThought() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("gifgs rhurx grlm", AtbashCipher.encode("Truth is fiction."))
  }

  func testEncodeAllTheLetters() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt",
      AtbashCipher.encode("The quick brown fox jumps over the lazy dog."))
  }

  func testDecodeExercism() {
    XCTAssertEqual("exercism", AtbashCipher.decode("vcvix rhn"))
  }

  func testDecodeASentence() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      "anobstacleisoftenasteppingstone",
      AtbashCipher.decode("zmlyh gzxov rhlug vmzhg vkkrm thglm v"))
  }

  func testDecodeNumbers() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("testing123testing", AtbashCipher.decode("gvhgr mt123 gvhgr mt"))
  }

  func testDecodeAllTheLetters() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      "thequickbrownfoxjumpsoverthelazydog",
      AtbashCipher.decode("gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"))
  }

  func testDecodeWithTooManySpaces() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("exercism", AtbashCipher.decode("vc vix    r hn"))
  }

  func testDecodeWithNoSpaces() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      "anobstacleisoftenasteppingstone", AtbashCipher.decode("zmlyhgzxovrhlugvmzhgvkkrmthglmv"))
  }
}
