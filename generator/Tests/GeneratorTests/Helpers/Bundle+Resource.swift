import Foundation

enum ResourceError: Error, CustomStringConvertible {
    case missingResource(name: String, subdirectory: String?)

    var description: String {
        switch self {
        case let .missingResource(name, subdirectory):
            return "Missing resource: \(name) \(subdirectory == nil ? "" : "in \(subdirectory!)")"
        }
    }
}

extension Bundle {
    
    func urlForResource(_ name: String, fileExtension: String, subdirectory: String? = nil) throws -> URL {
        guard let url = url(forResource: name, withExtension: fileExtension, subdirectory: subdirectory) else {
            throw ResourceError.missingResource(name: name, subdirectory: subdirectory)
        }
        return url
    }

}
