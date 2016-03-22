// Foundation not needed


    
struct House {
    
    private static let pieces = [
        ["the horse and the hound and the horn", "that belonged to"],
        ["the farmer sowing his corn", "that kept"],
        ["the rooster that crowed in the morn", "that woke"],
        ["the priest all shaven and shorn", "that married"],
        ["the man all tattered and torn", "that kissed"],
        ["the maiden all forlorn", "that milked"],
        ["the cow with the crumpled horn", "that tossed"],
        ["the dog", "that worried"],
        ["the cat", "that killed"],
        ["the rat", "that ate"],
        ["the malt", "that lay in"],
        ["the house that Jack built"]
    ]
    
    static func recite() -> String {
        #if swift(>=3.0)
        return (1...pieces.count).map { line($0) }.joined(separator: "\n\n")
        #else
        return (1...pieces.count).map { line($0) }.joinWithSeparator("\n\n")
        #endif
    }
    
    private static func line(number: Int) -> String {
        let startIndex = pieces.count - number
        let endIndex = pieces.count
        let selectedPieces = pieces[startIndex ..< endIndex]
        #if swift(>=3.0)
        let text = selectedPieces.map { $0.joined(separator: "\n") }.joined(separator: " ")
        #else
        let text = selectedPieces.map { $0.joinWithSeparator("\n") }.joinWithSeparator(" ")
        #endif
        return "This is \(text)."
    }
    
}

