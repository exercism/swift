

import Foundation

struct SpaceAge{
    
    var seconds:Float  = 0
    
    var on_mercury:Float { get { return  round((seconds / 7_600_530.24)*100)/100}}
    var on_venus:Float { get { return  round((seconds /  19_413_907.2)*100)/100}}
    var on_earth:Float { get { return  round((seconds /  31_558_149.76)*100)/100}}
    var on_mars:Float { get { return  round((seconds /  59_354_294.4)*100)/100}}
    var on_jupiter:Float { get { return  round((seconds /  374_335_776.0)*100)/100}}
    var on_saturn:Float { get { return  round((seconds /  929_596_608.0)*100)/100}}
    var on_uranus:Float { get { return  round((seconds /  2_661_041_808.0)*100)/100}}
    var on_neptune:Float { get { return  round((seconds /  5_200_418_592.0)*100)/100}}
    
    
    init(_ input:Float){
        
        self.seconds = input
        
    }
    
}

