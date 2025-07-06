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

enum Unit: String {
    case ohms
    case kiloohms
    case megaohms
    case gigaohms
}

enum ResistorColorTrioError: Error {
    case invalidInput
    case unknownColor
}

enum ResistorColorTrio {

    static func label(for colors: [String]) throws -> String {
        guard colors.count >= 3 else {
            throw ResistorColorTrioError.invalidInput
        }

        let convertedColors = try colors.reduce(into: [Color]()) { partialResult, string in
            guard let color = Color(rawValue: string) else {
                throw ResistorColorTrioError.unknownColor
            }
            partialResult.append(color)
        }

        var zeros = 0
        var value = 0
        let firstDigit = code(for: convertedColors[0])
        if (firstDigit > 0) {
            value += firstDigit
        }

        let secondDigit = code(for: convertedColors[1])
        if (secondDigit == 0) {
            zeros += 1
        }
        else {
            value = value * 10 + secondDigit
        }

        zeros += code(for: convertedColors[2])
        let (remaining, unit) = strip(zeros)
        return "\(value * Int(pow(10.0, Double(remaining)))) \(unit)"
    }

    private static func strip(_ zeros: Int) -> (remaining: Int, unit: String) {
        switch zeros {
            case 0, 1, 2: return (zeros % 3, Unit.ohms.rawValue)
            case 3, 4, 5: return (zeros % 3, Unit.kiloohms.rawValue)
            case 6, 7, 8: return (zeros % 3, Unit.megaohms.rawValue)
            case 9: return (0, Unit.gigaohms.rawValue)
            default: return (0, Unit.ohms.rawValue)            
        }
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