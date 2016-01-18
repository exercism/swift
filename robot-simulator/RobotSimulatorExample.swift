// Foundation not needed

// Apple Swift version 2.1

enum CardinalDirection {
    case North
    case East
    case South
    case West
    
    static let allValues: [CardinalDirection] = [.North, .East, .South, .West]
}

class SimulatedRobot {
    var bearing: CardinalDirection = .North
    var x: Int = 0
    var y: Int = 0
    var coordinates: [Int] {
        return [x, y]
    }
    
    func orient(bearing: CardinalDirection) {
        self.bearing = bearing
    }
    
    func turnRight() {
        if let index = CardinalDirection.allValues.indexOf(bearing) {
            let newIndex = (index + 1) % 4
            bearing = CardinalDirection.allValues[newIndex]
        }
    }
    
    func turnLeft() {
        if let index = CardinalDirection.allValues.indexOf(bearing) {
            var newIndex = (index - 1) % 4
            if newIndex < 0 {
                newIndex += 4
            }
            bearing = CardinalDirection.allValues[newIndex]
        }
    }
    
    func at(x x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func advance() {
        switch bearing {
            // Note: ++ and -- will be deprecated in Swift 2.2 and removed in Swift 3.0
            // See https://github.com/apple/swift-evolution/blob/master/proposals/0004-remove-pre-post-inc-decrement.md
            case .North: y += 1
            case .East:  x += 1
            case .South: y -= 1
            case .West:  x -= 1
        }
    }
}

enum RobotInstruction: String {
    case TurnLeft  = "L"
    case TurnRight = "R"
    case Advance   = "A"
}

struct Simulator {
    
    func instructions(instructions: String) -> [RobotInstruction] {
        var result = [RobotInstruction]()
        
        let characters = instructions.characters.map { String($0) }
        
        for character in characters {
            if let instruction = RobotInstruction(rawValue: character) {
                result.append(instruction)
            }
        }
        
        return result
    }
    
    func place(robot: SimulatedRobot, x: Int, y: Int, direction: CardinalDirection) {
        robot.at(x: x, y: y)
        robot.orient(direction)
    }
    
    func evaluate(robot: SimulatedRobot, commands: String) {
        for instruction in instructions(commands) {
            switch instruction {
                case .TurnLeft:  robot.turnLeft()
                case .TurnRight: robot.turnRight()
                case .Advance:   robot.advance()
            }
        }
    }
    
}
