enum TranslationError: Error {
  case invalidCodon
}

func lookup(codon: String) -> String? {
  switch codon {
  case "AUG":
    return "Methionine"
  case "UUU", "UUC":
    return "Phenylalanine"
  case "UUA", "UUG":
    return "Leucine"
  case "UCU", "UCC", "UCA", "UCG":
    return "Serine"
  case "UAU", "UAC":
    return "Tyrosine"
  case "UGU", "UGC":
    return "Cysteine"
  case "UGG":
    return "Tryptophan"
  case "UAA", "UAG", "UGA":
    return "STOP"
  default:
    return nil
  }
}

func translationOfCodon(_ codon: String) throws -> String {
  guard let protein = lookup(codon: codon) else {
    throw TranslationError.invalidCodon
  }

  return protein
}

func translationOfRNA(rna strand: String) throws -> [String] {
  var strand = strand
  var result = [String]()

  while !strand.isEmpty {
    let codon = String(strand.prefix(3))
    let translation = try translationOfCodon(codon)
    if translation == "STOP" {
      return result
    }
    result.append(translation)
    strand = String(strand.dropFirst(3))
  }

  return result
}
