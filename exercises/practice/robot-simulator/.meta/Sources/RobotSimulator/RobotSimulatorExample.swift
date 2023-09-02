class SimulatedRobot {

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

    init(x: Int, y: Int, bearing: Direction) {
        self.x = x
        self.y = y
        self.bearing = bearing
    }

    func move(commands: String) {
        for command in commands {
            switch command {
            case "L":
                turnLeft()
            case "R":
                turnRight()
            case "A":
                advance()
            default:
                break
            }
        }
    }

    func turnLeft() {
        switch bearing {
        case .north:
            bearing = .west
        case .east:
            bearing = .north
        case .south:
            bearing = .east
        case .west:
            bearing = .south
        }
    }

    func turnRight() {
        switch bearing {
        case .north:
            bearing = .east
        case .east:
            bearing = .south
        case .south:
            bearing = .west
        case .west:
            bearing = .north
        }
    }

    func advance() {
        switch bearing {
        case .north:
            y += 1
        case .east:
            x += 1
        case .south:
            y -= 1
        case .west:
            x -= 1
        }
    }

    var state: (x: Int, y: Int, bearing: Direction) {
        return (x, y, bearing)
    }
}
