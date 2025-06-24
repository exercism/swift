import Foundation

enum Color: String, CaseIterable {
    case black
    case brown
    case red
    case orange
    case yellow
    case green
    case blue
    case violet
    case grey
    case white
}

enum ResistorColorError: Error {
    case unknownColor
}

enum ResistorColor {
    
    static func colorCode(for name: String) throws -> Int {
        guard let color = Color(rawValue: name) else {
            throw ResistorColorError.unknownColor
        }
        return code(for: color)
    }

    static var colors: [String] {
        return Array(Color.allCases.map { $0.rawValue })
    }

}

fileprivate func code(for color: Color) -> Int {
    switch color {
        case .black: return 0
        case .brown: return 1
        case .red: return 2
        case .orange: return 3
        case .yellow: return 4
        case .green: return 5
        case .blue: return 6
        case .violet: return 7
        case .grey: return 8
        case .white: return 9
    }
}