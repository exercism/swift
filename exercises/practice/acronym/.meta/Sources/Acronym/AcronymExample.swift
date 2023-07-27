import Foundation

class Acronym {
    static func abbreviate(_ phrase: String) -> String {
    let words = phrase.components(separatedBy: CharacterSet(charactersIn: " -_"))
    var acronym = ""
    
    for word in words {
        if let firstCharacter = word.first {
            acronym.append(String(firstCharacter).uppercased())
        }
    }
    
    return acronym
    }
}