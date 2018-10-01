enum Nucleobase: Character {
    case adenine = "A",
    cytosine = "C",
    thymine = "T",
    guanine = "G"
}

struct DNA {

    var nucleotideCounts: [Nucleobase: Int] = [ .adenine: 0, .thymine: 0, .cytosine: 0, .guanine: 0 ]

    init?(strand: String) {
        let enumarated = strand.enumerated()

        for (_, value) in enumarated {
            if let possibleNucleobase = Nucleobase(rawValue: value) {
                nucleotideCounts[possibleNucleobase]! += 1
            } else {
                return nil
            }
        }
    }

    func count(_ value: Character) -> Int {
        return nucleotideCounts[Nucleobase(rawValue: value)!]!
    }

    func counts() -> [String: Int] {
        var nCounts: [String: Int] = [:]
        for (k, v) in nucleotideCounts {
            nCounts[String(k.rawValue)] = v
        }
        return nCounts
    }

}
