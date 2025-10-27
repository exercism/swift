import Testing
import Foundation
@testable import Generator

@Test
func `Testing exercise config file not found`() {
    let error = #expect(throws: CocoaError.self) {
        _ = try ExerciseConfig(from: URL(filePath: "config.json"))
    }
    #expect(error?.code == .fileReadNoSuchFile)
}

@Test
func `Testing exercise config file has valid structure`() {
    #expect(throws: Never.self) {
        _ = try ExerciseConfig(from: """
        {
          "files": {
            "solution": [],
            "test": [
              "Tests/AcronymTests/AcronymTests.swift"
            ],
            "example": []
          }
        }
        """)
    }
}

@Test
func `Testing exercise config file has invalid JSON structure`() {
    #expect(throws: DecodingError.self) {
        _ = try ExerciseConfig(from: """
        {
          "files": {
            "solution": [],
            "example": []
          }
        }
        """)
    }
}

@Test
func `Testing exercise config has 0 tests`() {
    let error = #expect(throws: GeneratorError.self) {
        let config = try ExerciseConfig(from: """
        {
          "files": {
            "solution": [],
            "test": [],
            "example": []
          }
        }
        """)
        _ = try config.getTargetTestFileURL()
    }
    guard case .internalError = error else {
        #expect(Bool(false), "Expected to return internal error")
        return
    }
}

@Test
func `Testing exercise config contains test file`() {
    #expect(throws: Never.self) {
        let config = try ExerciseConfig(from: """
        {
          "files": {
            "solution": [],
            "test": ["Tests/AcronymTests/AcronymTests.swift"],
            "example": []
          }
        }
        """)
        let path = try config.getTargetTestFileURL()
        #expect(path == "Tests/AcronymTests/AcronymTests.swift")
    }
}

@Test
func `Testing exercise config contains multiple test files`() {
    #expect(throws: Never.self) {
        let config = try ExerciseConfig(from: """
        {
          "files": {
            "solution": [],
            "test": ["Tests/AcronymTests/AcronymTests1.swift", "Tests/AcronymTests/AcronymTests2.swift"],
            "example": []
          }
        }
        """)
        let path = try config.getTargetTestFileURL()
        #expect(path == "Tests/AcronymTests/AcronymTests1.swift")
    }
}

@Test
func `Testing exercise config loads from fixture file`() throws {
    let expectedTestFilePath = "Tests/AcronymTests/AcronymTests.swift"
    let url = try Bundle.module.urlForResource("valid_config", fileExtension: "json", subdirectory: "Resources/ExerciseConfig")
    #expect(throws: Never.self) {
        let config = try ExerciseConfig(from: url)
        #expect(config.files.test.count == 1)
        #expect(expectedTestFilePath == config.files.test.first)
    }
}