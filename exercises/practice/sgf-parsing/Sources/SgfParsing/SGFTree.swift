import Foundation

enum SGFParsingError: Error {
    case missingTree
    case noNodes
    case noDelimiter
    case lowerCaseProperty
}

struct SGFTree: Codable, Equatable {
    var properties: [String: [String]] = [:]
    var children: [SGFTree] = []
}