import Foundation

struct CanonicalData {
    
    var jsonData: [String: Any]
    
    init(dictionary: [String: Any]) {
        self.jsonData = dictionary
    }
    
    init?(jsonString: String) {
        guard let data = jsonString.data(using: .utf8) else { return nil }
        guard let jsonData = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            return nil
        }
        self.init(dictionary: jsonData)
    }

}

extension CanonicalData {
    
    var uuidSet: Set<String> {
        var uuids = Set<String>()
        if let cases = jsonData["cases"] as? [[String: Any]] {
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

    mutating func whitelistTests(withUUIDs uuidsToKeep: Set<String>) {
        if let cases = jsonData["cases"] as? [[String: Any]] {
            jsonData["cases"] = whitelistTests(from: cases, withUUIDs: uuidsToKeep)
        }
    }
    
    private func whitelistTests(from cases: [[String: Any]], withUUIDs uuidsToKeep: Set<String>) -> [[String: Any]] {
        var result = [[String: Any]]()
        for caseData in cases {
            if let uuid = caseData["uuid"] as? String {
                uuidsToKeep.contains(uuid) ? result.append(caseData) : nil
            }
            else if let nestedCases = caseData["cases"] as? [[String: Any]] {
                let nestedWhitelisted = whitelistTests(from: nestedCases, withUUIDs: uuidsToKeep)
                nestedWhitelisted.isEmpty ? nil : result.append(["cases": nestedWhitelisted])
            }
        }
        return result
    }

    
}

extension CanonicalData {
    
    static func fetch(slug: String) async throws -> CanonicalData {
        let urlString = "https://raw.githubusercontent.com/exercism/problem-specifications/master/exercises/\(slug)/canonical-data.json"
        guard let url = URL(string: urlString) else {
            throw GeneratorError.remoteError("Invalid URL for exercise \(slug)")
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, (200..<300).contains(http.statusCode) else {
            throw GeneratorError.remoteError("HTTP error with code: \((response as? HTTPURLResponse)?.statusCode ?? -1)")
        }
        
        guard let jsonData = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            throw GeneratorError.remoteError("Invalid canonical data format")
        }
        
        return .init(dictionary: jsonData)
    }
    
}
