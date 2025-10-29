import Testing
import Foundation
@testable import Generator

@Test
func `Testing track config file not found`() {
    let error = #expect(throws: CocoaError.self) {
        _ = try TrackConfig(from: URL(filePath: "config.json"))
    }
    #expect(error?.code == .fileReadNoSuchFile)
}

@Test
func `Testing track config file has valid structure`() {
    #expect(throws: Never.self) {
        _ = try TrackConfig(from: testConfig)
    }
}

@Test
func `Testing track config file has invalid JSON structure`() {
    #expect(throws: DecodingError.self) {
        _ = try TrackConfig(from: "{ invalid-json }")
    }
}

@Test
func `Testing track config handles empty exercises arrays`() {
    #expect(throws: Never.self) {
        let config = try TrackConfig(from: "{\"exercises\": {\"concept\": [],\"practice\": []}}")
        #expect(config.checkExistance(slug: "nonexistent", kind: .concept) == false)
        #expect(config.checkExistance(slug: "nonexistent", kind: .practice) == false)
    }
}

@Test
func `Testing track config contains concept exercise`() {
    #expect(throws: Never.self) {
        let config = try TrackConfig(from: testConfig)
        #expect(config.checkExistance(slug: "wings-quest", kind: .concept))
    }
}

@Test
func `Testing track config does not contain concept exercise`() {
    #expect(throws: Never.self) {
        let config = try TrackConfig(from: testConfig)
        #expect(config.checkExistance(slug: "difference-of-squares", kind: .concept) == false)
    }
}

@Test
func `Testing track config contains practice exercise`() {
    #expect(throws: Never.self) {
        let config = try TrackConfig(from: testConfig)
        #expect(config.checkExistance(slug: "gigasecond", kind: .practice))
    }
}

@Test
func `Testing track config does not contains practice exercise`() {
    #expect(throws: Never.self) {
        let config = try TrackConfig(from: testConfig)
        #expect(config.checkExistance(slug: "lasagna", kind: .practice) == false)
    }
}

@Test
func `Testing track config loads from fixture file`() throws {
    let url = try Bundle.module.urlForResource("valid_config", fileExtension: "json", subdirectory: "Resources/TrackConfig")
    #expect(throws: Never.self) {
        let config = try TrackConfig(from: url)
        #expect(config.checkExistance(slug: "lasagna", kind: .concept))
        #expect(config.checkExistance(slug: "gigasecond", kind: .practice))
    }
}

fileprivate let testConfig = """
{
  "exercises": {
    "concept": [
      {
        "slug": "lasagna",
        "name": "Layers of Lasagna",
        "uuid": "44ae5892-40a5-4483-a181-28e1c38645d6",
      },
      {
        "slug": "wings-quest",
        "name": "Wings Quest",
        "uuid": "13a703ee-2180-49c6-86c7-7c848d636a3c",
      }
    ],
    "practice": [
      {
        "slug": "difference-of-squares",
        "name": "Difference of Squares",
        "uuid": "ef114733-886b-4d4b-a713-3ba169a85025",
      },
      {
        "slug": "gigasecond",
        "name": "Gigasecond",
        "uuid": "0a1ae85a-1d89-453a-8b97-303181d7874d",
      }
    ]
  },
}
"""
