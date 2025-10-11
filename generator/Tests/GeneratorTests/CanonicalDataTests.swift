import Testing
import Foundation
@testable import Generator

@Test
func `Track canonical data has nested tests`() {
    let expectedUUIDs = Set(["first", "second", "third", "fourth"])
    #expect(throws: Never.self) {
        guard let data = try CanonicalData(from: validJSONWithNestedTests) else {
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
        guard var data = try CanonicalData(from: validJSONWithNestedTests) else {
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
        guard var data = try CanonicalData(from: validJSONWithNestedTests) else {
            #expect(Bool(false), "Failed to construct canonical data")
            return
        }
        data.whitelistTests(withUUIDs: expectedUUIDs)
        #expect(data.uuidSet == expectedUUIDs)
    }
}

// MARK: - Helpers

extension CanonicalData {
    
    init?(from string: String) {
        guard let data = string.data(using: .utf8) else { return nil }
        guard let jsonData = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            return nil
        }
        self.init(dictionary: jsonData)
    }
    
    var uuidSet: Set<String> {
        var uuids = Set<String>()
        if let cases = context["cases"] as? [[String: Any]] {
            uuids.formUnion(collectUUIDs(from: cases))
        }
        return uuids
    }
    
    private func collectUUIDs(from cases: [[String: Any]]) -> Set<String> {
        var uuids = Set<String>()
        for caseData in cases {
            if let uuid = caseData["uuid"] as? String {
                uuids.insert(uuid)
            }
            else if let nestedCases = caseData["cases"] as? [[String: Any]] {
                uuids.formUnion(collectUUIDs(from: nestedCases))
            }
        }
        return uuids
    }

}

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
