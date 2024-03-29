class House {
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
    ["the house that Jack built"],
  ]

  static func recite(start: Int, end: Int) -> String {
    return (start...end).map { verse($0) }.joined(separator: "\n")
  }

  private static func verse(_ number: Int) -> String {
    let startIndex = pieces.count - number
    let endIndex = pieces.count
    let selectedPieces = pieces[startIndex..<endIndex]
    let text = selectedPieces.map { $0.joined(separator: " ") }.joined(separator: " ")

    return "This is \(text)."
  }
}
