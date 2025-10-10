import Testing
import Foundation
@testable import Generator


@Test
func `Track canonical data has valid structure`() {
    #expect(throws: Never.self) {
        _ = try CanonicalData(jsonString: validJSON)
    }
}

@Test
func `Track canonical data has invalid JSON structure`() {
    #expect(throws: DecodingError.self) {
        _ = try TrackConfig(jsonString: "{ invalid-json }")
    }
}

@Test
func `Track canonical data has nested tests`() {
    let expectedUUIDs = Set(["first", "second", "third", "fourth"])
    #expect(throws: Never.self) {
        guard let data = try CanonicalData(jsonString: validJSONWithNestedTests) else {
            #expect(Bool(false), "Failed to construct canonical data")
            return
        }
        #expect(expectedUUIDs == data.uuidSet)
    }
}

@Test
func `Track canonical data all tests are kept`() {
    let expectedUUIDs = Set(["first", "second", "third", "fourth"])
    #expect(throws: Never.self) {
        guard var data = try CanonicalData(jsonString: validJSONWithNestedTests) else {
            #expect(Bool(false), "Failed to construct canonical data")
            return
        }
        data.whitelistTests(withUUIDs: expectedUUIDs)
        #expect(data.uuidSet == expectedUUIDs)
    }
}

@Test
func `Track canonical data part of the tests are excluded`() {
    let expectedUUIDs = Set(["third", "fourth"])
    #expect(throws: Never.self) {
        guard var data = try CanonicalData(jsonString: validJSONWithNestedTests) else {
            #expect(Bool(false), "Failed to construct canonical data")
            return
        }
        data.whitelistTests(withUUIDs: expectedUUIDs)
        #expect(data.uuidSet == expectedUUIDs)
    }
}

fileprivate var validJSON = """
{
  "exercise": "acronym",
  "cases": [
    {
      "uuid": "1e22cceb-c5e4-4562-9afe-aef07ad1eaf4",
      "description": "basic",
    },
    {
      "uuid": "79ae3889-a5c0-4b01-baf0-232d31180c08",
      "description": "lowercase words",
    }
  ]
}
"""

fileprivate var validJSONWithNestedTests = """
{
  "exercise": "acronym",
  "cases": [
    { "uuid": "first" },
    {
        "cases": [
            { "uuid": "second" },
            {
                "cases": [
                    { "uuid": "third", },
                    {
                        "cases": [
                            { "uuid": "fourth" }
                        ]
                    }
                ]
            }
        ]
    }
  ]
}
"""
