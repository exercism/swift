import Foundation

class Acronym {
    static func abbreviate(_ phrase: String) -> String {
        let words = phrase.components(separatedBy: CharacterSet(charactersIn: " -"))
        return words.reduce("") { $0 + $1.prefix(1) }
    }
}