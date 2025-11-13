import Foundation

struct ExerciseConfig: Config {
    
    struct Files: Codable {
        let solution: [String]
        let test: [String]
        let example: [String]
    }
    
    let files: Files
    
    func getTargetTestFileURL() throws -> String {
        if files.test.isEmpty {
            throw GeneratorError.internalError("Exercise config file has an unexpected format or no test files are defined.")
        }
        return files.test.first!
    }

}
