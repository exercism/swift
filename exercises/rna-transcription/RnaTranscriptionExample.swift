// Foundation not needed

struct Nucleotide {
    
    var complementOfDNA:String{ return transcrive(DnaToRna) }
    
    private var value = ""
    
    init(_ nucleotide:String){
    self.value = nucleotide
        
    }
    
    private var DnaToRna:[Character:String] = [ "G": "C" ,  "C": "G" , "T": "A" ,  "A": "U" ]

    func transcrive(dict:[Character : String]) -> String{
        var tempText = ""
        for each in self.value.characters{
            tempText += dict[each] ?? ""
        }
        return tempText
    }

}
