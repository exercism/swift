struct SimulatedRobot {

    enum Direction {
        case north
        case east
        case south
        case west

        static let allValues: [Direction] = [.north, .east, .south, .west]
    }

    enum Instruction: String {
        case turnLeft  = "L"
        case turnRight = "R"
        case advance   = "A"
    }

    var bearing: Direction = .north
    var x: Int = 0
    var y: Int = 0
    var coordinates: [Int] {
        return [x, y]
    }

    mutating func orient(_ bearing: Direction) {
        self.bearing = bearing
    }

    mutating func turnRight() {
        if let index = Direction.allValues.index(of: bearing) {
            var newIndex = index + 1
            if newIndex > 3 {
                newIndex -= 4
            }
            bearing = Direction.allValues[newIndex]
        }
    }

    mutating func turnLeft() {
        if let index = Direction.allValues.index(of: bearing) {
            var newIndex = index - 1
            if newIndex < 0 {
                newIndex += 4
            }
            bearing = Direction.allValues[newIndex]
        }
    }

    mutating func at(x: Int, y: Int) {
        self.x = x
        self.y = y
    }

    mutating func advance() {
        switch bearing {
        case .north: y += 1
        case .east:  x += 1
        case .south: y -= 1
        case .west:  x -= 1
        }
    }

    func instructions(_ instructions: String) -> [Instruction] {
        var result = [Instruction]()

        let characters = instructions.map { String($0) }

        for character in characters {
            if let instruction = Instruction(rawValue: character) {
                result.append(instruction)
            }
        }

        return result
    }

    mutating func place(x: Int, y: Int, direction: Direction) {
        at(x: x, y: y)
        orient(direction)
    }

    mutating func evaluate(_ commands: String) {
        for instruction in instructions(commands) {
            switch instruction {
            case .turnLeft:  turnLeft()
            case .turnRight: turnRight()
            case .advance:   advance()
            }
        }
    }

}
