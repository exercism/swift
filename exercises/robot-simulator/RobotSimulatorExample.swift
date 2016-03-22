// Foundation not needed



struct SimulatedRobot {
    
    enum Direction {
        case North
        case East
        case South
        case West
        
        static let allValues: [Direction] = [.North, .East, .South, .West]
    }
    
    enum Instruction: String {
        case TurnLeft  = "L"
        case TurnRight = "R"
        case Advance   = "A"
    }
    
    var bearing: Direction = .North
    var x: Int = 0
    var y: Int = 0
    var coordinates: [Int] {
        return [x, y]
    }
    
    mutating func orient(bearing: Direction) {
        self.bearing = bearing
    }
    
    mutating func turnRight() {
        if let index = Direction.allValues.indexOf(bearing) {
            var newIndex = index + 1
            if newIndex > 3 {
                newIndex -= 4
            }
            bearing = Direction.allValues[newIndex]
        }
    }
    
    mutating func turnLeft() {
        if let index = Direction.allValues.indexOf(bearing) {
            var newIndex = index - 1
            if newIndex < 0 {
                newIndex += 4
            }
            bearing = Direction.allValues[newIndex]
        }
    }
    
    mutating func at(x x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    mutating func advance() {
        switch bearing {
            // Note: ++ and -- will be deprecated in Swift 2.2 and removed in Swift 3.0
            // See https://github.com/apple/swift-evolution/blob/master/proposals/0004-remove-pre-post-inc-decrement.md
            case .North: y += 1
            case .East:  x += 1
            case .South: y -= 1
            case .West:  x -= 1
        }
    }
    
    func instructions(instructions: String) -> [Instruction] {
        var result = [Instruction]()
        
        let characters = instructions.characters.map { String($0) }
        
        for character in characters {
            if let instruction = Instruction(rawValue: character) {
                result.append(instruction)
            }
        }
        
        return result
    }
    
    mutating func place(x x: Int, y: Int, direction: Direction) {
        at(x: x, y: y)
        orient(direction)
    }
    
    mutating func evaluate(commands: String) {
        for instruction in instructions(commands) {
            switch instruction {
                case .TurnLeft:  turnLeft()
                case .TurnRight: turnRight()
                case .Advance:   advance()
            }
        }
    }

}

