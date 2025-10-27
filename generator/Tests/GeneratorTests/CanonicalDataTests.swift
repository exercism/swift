import Testing
import Foundation
@testable import Generator

@Test
func `Track canonical data all tests are kept`() throws {
    let expectedUUIDs = Set(["a", "b", "c", "d"])
    let expectedData = try CanonicalData(from: "valid_config")
    let data = try CanonicalData(from: "valid_config")

    #expect(data.uuidSet == expectedUUIDs)
    #expect(data == expectedData)
}

@Test
func `Track canonical data all tests are kept after whitelisting`() throws {
    let expectedUUIDs = Set(["a", "b", "c", "d"])
    let expectedData = try CanonicalData(from: "valid_config")
    var data = try CanonicalData(from: "valid_config")

    data.whitelistTests(withUUIDs: expectedUUIDs)

    #expect(data.uuidSet == expectedUUIDs)
    #expect(data == expectedData)
}

@Test
func `Track canonical data some tests are filtered`() throws {
    let expectedUUIDs = Set(["b", "c"])
    let expectedData = try CanonicalData(from: "valid_config_whitelisted")
    var data = try CanonicalData(from: "valid_config")

    data.whitelistTests(withUUIDs: expectedUUIDs)

    #expect(data.uuidSet == expectedUUIDs)
    #expect(data == expectedData)
}

@Test
func `Track canonical data all tests are filtered`() throws {
    let expectedUUIDs = Set<String>()
    let expectedData = try CanonicalData(from: "valid_config_empty")
    var data = try CanonicalData(from: "valid_config")

    data.whitelistTests(withUUIDs: expectedUUIDs)

    #expect(data.uuidSet == expectedUUIDs)
    #expect(data == expectedData)
}

@Test
func `Track canonical data all tests are filtered with missing keys`() throws {
    let expectedUUIDs = Set<String>()
    let expectedData = try CanonicalData(from: "valid_config_empty")
    var data = try CanonicalData(from: "valid_config")

    data.whitelistTests(withUUIDs: ["e", "f", "g", "e"])

    #expect(data.uuidSet == expectedUUIDs)
    #expect(data == expectedData)
}

@Test
func `Track canonical data all tests are kept in nested`() throws {
    let expectedUUIDs = Set(["first", "second", "third", "fourth", "fiths", "sixth"])
    var data = try CanonicalData(from: "valid_nested")

    data.whitelistTests(withUUIDs: expectedUUIDs)

    #expect(data.uuidSet == expectedUUIDs)
}

@Test
func `Track canonical data some tests are kept in nested`() throws {
    let expectedUUIDs = Set(["first", "third", "fiths"])
    var data = try CanonicalData(from: "valid_nested")

    data.whitelistTests(withUUIDs: expectedUUIDs)

    #expect(data.uuidSet == expectedUUIDs)
}

// MARK: - Helpers

extension CanonicalData {

    fileprivate init(from fileName: String) throws {
        let url = try Bundle.module.urlForResource(fileName)
        let data = try Data(contentsOf: url)
        let jsonData = try JSONSerialization.jsonObject(with: data)

        guard let jsonDictionary = jsonData as? [String: Any] else {
            #expect(Bool(false), "Expected json data to be of type [String: Any].")
            self.init(dictionary: [:])
            return
        }

        self.init(dictionary: jsonDictionary)
    }
    
    fileprivate var uuidSet: Set<String> {
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

extension CanonicalData: Equatable {

    public static func == (lhs: Self, rhs: Self) -> Bool { deepEqual(lhs.context, rhs.context) }

    private static func deepEqual(_ lhs: Any?, _ rhs: Any?) -> Bool {
        switch (lhs, rhs) {
        case (nil, nil):
            return true

        case let (l as [String: Any?], r as [String: Any?]):
            guard Set(l.keys) == Set(r.keys) else { return false }
            return l.allSatisfy { key, value in deepEqual(value, r[key] ?? nil) }

        case let (l as [Any], r as [Any]):
            guard l.count == r.count else { return false }
            return zip(l, r).allSatisfy { deepEqual($0, $1) }

        case let (l as NSNumber, r as NSNumber):
            return l == r

        case let (l as Bool, r as Bool):
            return l == r

        case let (l as String, r as String):
            return l == r

        default:
            return false
        }
    }

}

extension Bundle {

    fileprivate func urlForResource(_ name: String) throws -> URL {
        return try urlForResource(name, fileExtension: "json", subdirectory: "Resources/CanonicalData")
    }

}
