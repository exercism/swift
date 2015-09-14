import Darwin

// Apple Swift version 2.0

struct Triplet {
    
    var a:Int, b:Int, c:Int = 0
    
    init(_ a:Int, _ b:Int, _ c:Int){
        self.a = a
        self.b = b
        self.c = c
    }
    
    var sum:Int{return a + b + c }
    
    var product:Int{return a * b * c }
    
    var isPythagorean:Bool{return pow(Double(a), 2) + pow(Double(b), 2) == pow(Double(c), 2)}
    
    static func Where(minFactor:Int = 1, maxFactor:Int, sum:Int = 0)->[Triplet]{
        
        func shouldIncludeTriplet(sum:Int, triplet:Triplet)-> Bool {
            return triplet.isPythagorean && (sum == 0 || triplet.sum == sum)
        }
        
        var triplets = [Triplet]()
        for var i = minFactor; i < maxFactor - 1; i++ {
            for var j = i + 1; j < maxFactor; j++ {
                for var k = j + 1; k <= maxFactor; k++ {
                    let triplet = Triplet(i, j, k)
                    if shouldIncludeTriplet(sum, triplet: triplet){
                        triplets.append(triplet)
                    }
                }
            }
        }
        return triplets;
    }
    
}
