enum TranscriptionError: Error {
    case invalidNucleotide(String)
}

struct Nucleotide {
    func complementOfDNA() throws -> String {
        return try transcribe(dnaToRna)
    }

    private let value: String

    init(_ nucleotide: String) {
        self.value = nucleotide
    }

    private let dnaToRna: [Character: String] = [ "G": "C", "C": "G", "T": "A", "A": "U" ]

    private func transcribe(_ dict: [Character: String]) throws -> String {
        var tempText = ""
        for each in self.value {
            if dict[each] == nil {
                throw TranscriptionError.invalidNucleotide("\(each) is not a valid Nucleotide")
            }
            tempText += dict[each] ?? ""
        }
        return tempText
    }
}
