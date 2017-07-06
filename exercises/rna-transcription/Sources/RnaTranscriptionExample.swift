enum TranscriptionError: Error {
    case InvalidNucleotide
}

struct Nucleotide {
    func complementOfDNA() throws -> String {
        return try transcribe(dnaToRna)
    }

    private let value: String

    init(_ nucleotide: String) {
        self.value = nucleotide
    }

    private let dnaToRna: [Character:String] = [ "G": "C", "C": "G", "T": "A", "A": "U" ]

    private func transcribe(_ dict: [Character : String]) throws -> String {
        var tempText = ""
        for each in self.value.characters {
            if (dict[each] == nil) {
                throw TranscriptionError.InvalidNucleotide
            }
            tempText += dict[each] ?? ""
        }
        return tempText
    }
}
