struct ScaleGenerator {

    private let tonic: String
    private let scaleName: String
    private let pattern: String?
    private let chromaticScale: [String]

    private let sharpChromaticScale = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
    private let flatChromaticScale = ["C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab", "A", "Bb", "B"]
    private let flatKeys = ["F", "Bb", "Eb", "Ab", "Db", "Gb", "d", "g", "c", "f", "bb", "eb"]

    private enum IntervalType: Character {
        case minor = "m"
        case major = "M"
        case augmented = "A"

        var halfSteps: Int {
            switch self {
            case .minor:
                return 1
            case .major:
                return 2
            case .augmented:
                return 3
            }
        }
    }

    var name: String {
        return "\(tonic) \(scaleName)"
    }

    init(tonic: String, scaleName: String, pattern: String? = nil) {
        self.tonic = tonic.prefix(1).uppercased() + tonic.dropFirst()
        self.scaleName = scaleName
        self.pattern = pattern
        if flatKeys.contains(tonic) {
            self.chromaticScale = flatChromaticScale
        } else {
            self.chromaticScale = sharpChromaticScale
        }
    }

    func pitches() -> [String] {
        var pitches = reorderChromaticScale()

        if let pattern = pattern {
            var lastIndex = 0

            let scale: [String] = pattern.map {
                let pitch = pitches[lastIndex]
                lastIndex += IntervalType(rawValue: $0)?.halfSteps ?? 0

                return pitch
            }

            return scale
        } else {
            return pitches
        }
    }

    private func reorderChromaticScale() -> [String] {
        let scale: [String]

        if flatKeys.contains(tonic) {
            scale = flatChromaticScale
        } else {
            scale = chromaticScale
        }

        guard let index = scale.index(of: tonic) else {
            return scale
        }

        return Array(scale[index...] + scale[0..<index])
    }
}
