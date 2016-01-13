// Foundation not needed

// Apple Swift version 2.1

struct Nucleotide {
    
    var complementOfDNA:String{ return transcrive(DnaToRna) }
    var complementOfRNA:String{ return transcrive(RnaToDna) }
    
    var value = ""
    init(_ nucleotide:String){
    self.value = nucleotide
        
    }
    
    var DnaToRna:[Character:String] = [ "G": "C" ,  "C": "G" , "T": "A" ,  "A": "U" ]
    var RnaToDna:[Character:String] = [ "C": "G" ,  "G": "C" , "A": "T" ,  "U": "A" ]

    func transcrive(dict:[Character : String]) -> String{
        var tempText = ""
        for each in self.value.characters{
            tempText += dict[each] ?? ""
        }
        return tempText
    }

}