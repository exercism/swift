func toRna(_ dna: String) -> String {
  var rna = ""

    for nucleotide in dna {
        switch nucleotide {
        case "G":
        rna += "C"
        case "C":
        rna += "G"
        case "T":
        rna += "A"
        case "A":
        rna += "U"
        default:
        continue
        }
    }
    return rna
}
