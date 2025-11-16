import Foundation

extension URL {
    
    func validateFileExists() throws {
        var isDirectory: ObjCBool = true
        let exists = FileManager.default.fileExists(atPath: path, isDirectory: &isDirectory)
        guard exists && !isDirectory.boolValue else {
            throw GeneratorError.noFile("No such file: \(path)")
        }
    }
    
    func validateDirectoryExists() throws {
        var isDirectory: ObjCBool = true
        let exists = FileManager.default.fileExists(atPath: path, isDirectory: &isDirectory)
        guard exists && isDirectory.boolValue else {
            throw GeneratorError.noDirectory("No such directory: \(path)")
        }
    }
    
}
