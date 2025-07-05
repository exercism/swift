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

enum ResistorColorDuoError: Error {
    case unknownColor
}

enum ResistorColorDuo {

    static func value(for colors: [String]) throws -> Int {
        var result = 0
        for index in 0..<min(colors.count, 2) {
            guard let color = Color(rawValue: colors[index]) else {
                throw ResistorColorDuoError.unknownColor
            }
            let value = code(for: color)
            result = result * 10 + value
        }
        return result 
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