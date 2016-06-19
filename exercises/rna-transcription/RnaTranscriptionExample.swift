

struct Nucleotide {
    
    var complementOfDNA:String{ return transcribe(dnaToRna) }
    
    private let value:String
    
    init(_ nucleotide:String){
        self.value = nucleotide
    }
    
    private let dnaToRna:[Character:String] = [ "G": "C" ,  "C": "G" , "T": "A" ,  "A": "U" ]

    private func transcribe(_ dict:[Character : String]) -> String{
        var tempText = ""
        for each in self.value.characters{
            tempText += dict[each] ?? ""
        }
        return tempText
    }
}
