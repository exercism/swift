import Testing
@testable import Generator

@Test("Testing having all tests be included")
func testAllTestsIncluded() {
    let generatorHelp = GeneratorHelp(exercise: "two-fer", filePath: "./Tests/GeneratorTests/files/all-tests-included")
    #expect(throws: Never.self) {try generatorHelp.toml()}
    let expected = ["1cf3e15a-a3d7-4a87-aeb3-ba1b43bc8dce", "3549048d-1a6e-4653-9a79-b0bda163e8d5", "b4c6dbb8-b4fb-42c2-bafd-10785abe7709"]
    #expect(generatorHelp.uuids == expected)
}

@Test("Testing having all tests be removed")
func testAllTestsRemoved() {
    let generatorHelp = GeneratorHelp(exercise: "two-fer", filePath: "./Tests/GeneratorTests/files/all-test-removed")
    #expect(throws: Never.self) {try generatorHelp.toml()}
    let expected: [String] = []
    #expect(generatorHelp.uuids == expected)
}

@Test("Testing having two tests be removed")
func testTwoTestsRemoved() {
    let generatorHelp = GeneratorHelp(exercise: "two-fer", filePath: "./Tests/GeneratorTests/files/two-tests-removed")
    #expect(throws: Never.self) {try generatorHelp.toml()}
    let expected = ["b4c6dbb8-b4fb-42c2-bafd-10785abe7709"]
    #expect(generatorHelp.uuids == expected)
}
