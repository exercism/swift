// Foundation not needed

// Apple Swift version 2.1

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
        for key in Array(commandValues.keys).sort( < ){
            if (commandValue & key) != 0 {
                commands.append(commandValues[key]!)
            }
        }
        
        if shouldReverse{
            return Array(commands.reverse())
        }
        else {
            return commands
        }
    }
}