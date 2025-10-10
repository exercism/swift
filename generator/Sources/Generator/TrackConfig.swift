import Foundation

struct TrackConfig: Codable {
    
    struct Exercise: Codable {
        let slug: String
        let name: String
        let uuid: String
    }
    
    struct Exercises: Codable {
        let concept: [Exercise]
        let practice: [Exercise]
    }
    
    let exercises: Exercises
 
    init(fileURL: URL) throws {
        try self.init(data: Data(contentsOf: fileURL))
    }
    
    init(jsonString: String) throws {
        try self.init(data: Data(jsonString.utf8))
    }
    
    private init(data: Data) throws {
        self = try JSONDecoder().decode(TrackConfig.self, from: data)
    }
    
    func checkExistance(slug: String, kind: ExerciseKind) -> Bool {
        exercises[kind].contains(slug: slug)
    }
    
}

extension TrackConfig.Exercises {
    
    fileprivate subscript(kind: ExerciseKind) -> [TrackConfig.Exercise] {
        switch kind {
        case .concept: concept
        case .practice: practice
        }
    }

}

extension Array where Element == TrackConfig.Exercise {
    
    fileprivate func contains(slug: String) -> Bool {
        first(where: { $0.slug == slug }) != nil
    }
    
}
