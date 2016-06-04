import Foundation

enum Plant: String {
    case Grass = "G"
    case Clover = "C"
    case Radishes = "R"
    case Violets = "V"
}

struct Garden {
    static private let defaultChildren = ["Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"]

    private let pots: [String : [Plant]]

    init(_ diagram: String, children: [String] = defaultChildren) {
        self.pots = Garden.parse(diagram, children: children)
    }

    func plantsForChild(child: String) -> [Plant] {
        guard let plants = pots[child] else {
            return []
        }
        return plants
    }

    private static func parse(diagram: String, children: [String]) -> [String : [Plant]] {
        #if swift(>=3.0)
            let sortedChildren = children.sorted(isOrderedBefore: <)
            let lines = diagram.componentsSeparatedByCharacters(in: NSCharacterSet.newline())
        #else
            let sortedChildren = children.sort(<)
            let lines = diagram.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
        #endif

        var result = [String : [Plant]]()
        var line1 = lines[0].characters.map { String($0) }
        var line2 = lines[1].characters.map { String($0) }

        var index = 0

        for child in sortedChildren {
            guard index < line1.count else {
                break
            }

            var pots = [Plant]()

            if let plant1 = Plant(rawValue: line1[index]),
                plant2 = Plant(rawValue: line1[index + 1]),
                plant3 = Plant(rawValue: line2[index]),
                plant4 = Plant(rawValue: line2[index + 1]) {
                pots = [plant1, plant2, plant3, plant4]
            }

            result[child] = pots

            index += 2
        }

        return result
    }
}
