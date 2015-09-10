//Foundation not needed

struct Raindrops {
    
    static func convert(number:Int)->String{
    var result = (number % 3, number % 5 , number % 7)
        switch result{
        case (0,0,0):return "PlingPlangPlong"
        case (_,0,0):return "PlangPlong"
        case (0,_,0):return "PlingPlong"
        case (0,0,_):return "PlingPlang"
        case (_,_,0):return "Plong"
        case (_,0,_):return "Plang"
        case (0,_,_):return "Pling"
        default:return "\(number)"
        }
    }
}

