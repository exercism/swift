struct FoodChain {

    private static let animals = ["fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse"]

    static func song() -> String {
        let verses = (1...8).map { verse($0) }
        return verses.joined(separator: "\n\n")
    }

    static func verse(_ number: Int) -> String {
        var result = ""

        var index = number - 1
        let animal = animals[index]
        result += "I know an old lady who swallowed a \(animal).\n"

        switch number {
        case 2: result += "It wriggled and jiggled and tickled inside her.\n"
        case 3: result += "How absurd to swallow a bird!\n"
        case 4: result += "Imagine that, to swallow a cat!\n"
        case 5: result += "What a hog, to swallow a dog!\n"
        case 6: result += "Just opened her throat and swallowed a goat!\n"
        case 7: result += "I don't know how she swallowed a cow!\n"
        case 8: result += "She's dead, of course!"; return result
        default: break
        }

        while index >= 1 {
            result += "She swallowed the \(animals[index]) to catch the \(animals[index - 1])"
            if index == 2 {
                result += " that wriggled and jiggled and tickled inside her"
            }
            result += ".\n"
            index -= 1
        }
        result += "I don't know why she swallowed the fly. Perhaps she'll die."

        return result
    }

}
