import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

struct CanonicalData {
    
    var context: [String: Any]
    
    init(dictionary: [String: Any]) {
        self.context = dictionary
    }
    
    mutating func whitelistTests(withUUIDs uuidsToKeep: Set<String>) {
        if let cases = context["cases"] as? [[String: Any]] {
            context["cases"] = whitelistTests(from: cases, withUUIDs: uuidsToKeep)
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
        print("Loading canonical data for \"\(slug)\"...", terminator: "")
        let urlString = "https://raw.githubusercontent.com/exercism/problem-specifications/master/exercises/\(slug)/canonical-data.json"
        guard let url = URL(string: urlString) else {
            throw GeneratorError.remoteError("Invalid URL for exercise \(slug)")
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, (200..<300).contains(http.statusCode) else {
            throw GeneratorError.remoteError("HTTP error with code: \((response as? HTTPURLResponse)?.statusCode ?? -1)")
        }
        print("OK!")
        guard let jsonData = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            throw GeneratorError.remoteError("Invalid canonical data format")
        }
        
        return .init(dictionary: jsonData)
    }
    
}
