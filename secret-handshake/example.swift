import Foundation

struct SecretHandshake{
    
    var commandValue:Int
    var commandValues = [1: "wink" , 2: "double blink", 4: "close your eyes" , 8: "jump"]
    
    init(_ commandValue:Int){
        self.commandValue = commandValue
    }
    
    var shouldReverse:Bool {return (commandValue & 16) != 0}
    
    var commands:[String] {return commandsFunc()}
    
    private func commandsFunc()->[String] {
        var commands = [String]()
        for key in commandValues.keys.array.sorted( < ){
            if (commandValue & key) != 0 {
                commands.append(commandValues[key]!)
            }
        }
        
        if shouldReverse{
            return commands.reverse()
        }
        else {
            return commands
        }
    }
}