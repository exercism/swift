import Foundation


extension String {
    init(_ myType: Clock) {
        self = myType.description
    }
}

func ==(lhs: Clock, rhs: Clock) -> Bool {
    return lhs.description == rhs.description
    
}

func <(lhs: Clock, rhs: Clock) -> Bool{
    let left = (lhs.hours * 60) + lhs.minutes
    let right = (rhs.hours * 60) + rhs.minutes
    return left < right
 
}


func >(lhs: Clock, rhs: Clock) -> Bool{
    let left = (lhs.hours * 60) + lhs.minutes
    let right = (rhs.hours * 60) + rhs.minutes
    return left > right
    
}


struct Clock:Equatable, Printable, Comparable {
    
    var hours:Int
    var minutes:Int
    
    init(hours:Int, minutes:Int = 0){
        self.hours = hours
        self.minutes = minutes
        normalize()
    }
    
    var description: String { get {return self.toString} }

    
    func add(#minutes:Int) -> Clock{
        return Clock(hours: self.hours, minutes: self.minutes + minutes)
    }
    
    func subtract(#minutes:Int)-> Clock{
        return add(minutes: -minutes)
    }
    
    private var toString:String {
        
        var h = String(format: "%02d", self.hours)
        var m = String(format: "%02d", self.minutes)
        
        return h + ":" + m
    }
    
    private mutating func normalize() -> Void{
        if(minutes >= 60){
            self.hours += (self.minutes / 60)
            self.minutes = (self.minutes % 60)
        }
        while(self.minutes < 0){
            --self.hours
            self.minutes += 60
        }
        if(self.hours >= 24){
            self.hours = self.hours % 24
        }
        while(self.hours < 0) {
            self.hours += 24
        }
    }
    
}