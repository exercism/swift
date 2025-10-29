import Foundation

struct TrackConfig: Config {
    
    struct Exercise: Decodable {
        let slug: String
        let uuid: String
    }
    
    struct Exercises: Decodable {
        let concept: [Exercise]
        let practice: [Exercise]
    }
    
    let exercises: Exercises
    
    func checkExistance(slug: String, kind: ExerciseKind) -> Bool {
        exercises[kind].contains { $0.slug == slug }
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
