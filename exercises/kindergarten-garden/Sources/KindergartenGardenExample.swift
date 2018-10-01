import Foundation

enum Plant: String {
    case grass = "G"
    case clover = "C"
    case radishes = "R"
    case violets = "V"
}

struct Garden {
    static private let defaultChildren = ["Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"]

    private let pots: [String: [Plant]]

    init(_ diagram: String, children: [String] = defaultChildren) {
        self.pots = Garden.parse(diagram, children: children)
    }

    func plantsForChild(_ child: String) -> [Plant] {
        guard let plants = pots[child] else {
            return []
        }
        return plants
    }

    private static func parse(_ diagram: String, children: [String]) -> [String: [Plant]] {
        let sortedChildren = children.sorted(by: <)
        let lines = diagram.components(separatedBy: CharacterSet.newlines)
        var result = [String: [Plant]]()
        var line1 = lines[0].map { String($0) }
        var line2 = lines[1].map { String($0) }

        var index = 0

        for child in sortedChildren {
            guard index < line1.count else {
                break
            }

            var pots = [Plant]()

            if let plant1 = Plant(rawValue: line1[index]),
                let plant2 = Plant(rawValue: line1[index + 1]),
                let plant3 = Plant(rawValue: line2[index]),
                let plant4 = Plant(rawValue: line2[index + 1]) {
                pots = [plant1, plant2, plant3, plant4]
            }

            result[child] = pots

            index += 2
        }

        return result
    }
}
