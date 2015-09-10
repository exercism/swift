//Foundation not needed

enum Nucleobase: Character {
    case Adenine = "A",
    Cytosine = "C",
    Thymine = "T",
    Guanine = "G"
}

struct DNA {
    
    var nucleotideCounts:[Nucleobase:Int] = [ .Adenine: 0, .Thymine: 0, .Cytosine: 0 , .Guanine : 0 ]
    
    init?(strand: String) {
        for (_, value) in enumerate(strand) {
            if let possibleNucleobase = Nucleobase(rawValue: value) {
                nucleotideCounts[possibleNucleobase]! += 1
            }
            else {
                return nil
            }
        }
    }
    
    func count(value :Character)-> Int {
        return nucleotideCounts[Nucleobase(rawValue: value)!]!
    }
    
    func counts()->[String: Int] {
        var nCounts:[String:Int] = [:]
        for (k, v) in nucleotideCounts {
            nCounts[String(k.rawValue)] = v
        }
        return nCounts
    }
    
}

