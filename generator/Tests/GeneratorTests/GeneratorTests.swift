import XCTest
@testable import Generator

class GeneratorTests: XCTestCase {
    func testAllTestsIncluded() {
        let generatorHelp = GeneratorHelp(exercise: "two-fer", filePath: "./Tests/GeneratorTests/files/all-tests-included")
        XCTAssertNoThrow(try generatorHelp.toml())
        let expected = ["1cf3e15a-a3d7-4a87-aeb3-ba1b43bc8dce", "3549048d-1a6e-4653-9a79-b0bda163e8d5", "b4c6dbb8-b4fb-42c2-bafd-10785abe7709"]
        XCTAssertEqual(generatorHelp.uuids, expected)
    }

    func testAllTestsRemoved() {
        let generatorHelp = GeneratorHelp(exercise: "two-fer", filePath: "./Tests/GeneratorTests/files/all-test-removed")
        XCTAssertNoThrow(try generatorHelp.toml())
        let expected: [String] = []
        XCTAssertEqual(generatorHelp.uuids, expected)
    }

    func testTwoTestsRemoved() {
        let generatorHelp = GeneratorHelp(exercise: "two-fer", filePath: "./Tests/GeneratorTests/files/two-tests-removed")
        XCTAssertNoThrow(try generatorHelp.toml())
        let expected = ["b4c6dbb8-b4fb-42c2-bafd-10785abe7709"]
        XCTAssertEqual(generatorHelp.uuids, expected)
    }
}
