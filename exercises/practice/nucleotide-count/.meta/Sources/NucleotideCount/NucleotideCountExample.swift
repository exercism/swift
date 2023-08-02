enum NucleotideCountErrors: Error {
  case invalidNucleotide
}

enum Nucleobase: Character {
  case adenine = "A"
  case cytosine = "C"
  case thymine = "T"
  case guanine = "G"
}

struct DNA {

  var nucleotideCounts: [Nucleobase: Int] = [.adenine: 0, .thymine: 0, .cytosine: 0, .guanine: 0]

  init(strand: String) throws {
    let enumarated = strand.enumerated()

    for (_, value) in enumarated {
      if let possibleNucleobase = Nucleobase(rawValue: value) {
        nucleotideCounts[possibleNucleobase]! += 1
      } else {
        throw NucleotideCountErrors.invalidNucleotide
      }
    }
  }

  func counts() -> [String: Int] {
    var nCounts: [String: Int] = [:]
    for (k, v) in nucleotideCounts {
      nCounts[String(k.rawValue)] = v
    }
    return nCounts
  }
}
