import XCTest

// Apple Swift version 2.1

class RobotSimulatorTest: XCTestCase {
    
    let robot = SimulatedRobot()
    var simulator = Simulator()
    
    func testRobotBearing() {
        let directions: [CardinalDirection] = [.East, .West, .North, .South]
        
        for direction in directions {
            robot.orient(direction)
            XCTAssertEqual(direction, robot.bearing)
        }
    }
    
    func testTurnRightFromNorth() {
        robot.orient(.North)
        robot.turnRight()
        XCTAssertEqual(CardinalDirection.East, robot.bearing)
    }
    
    func testTurnRightFromEast() {
        robot.orient(.East)
        robot.turnRight()
        XCTAssertEqual(CardinalDirection.South, robot.bearing)
    }
    
    func testTurnRightFromSouth() {
        robot.orient(.South)
        robot.turnRight()
        XCTAssertEqual(CardinalDirection.West, robot.bearing)
    }
    
    func testTurnRightFromWest() {
        robot.orient(.West)
        robot.turnRight()
        XCTAssertEqual(CardinalDirection.North, robot.bearing)
    }
    
    func testTurnLeftFromNorth() {
        robot.orient(.North)
        robot.turnLeft()
        XCTAssertEqual(CardinalDirection.West, robot.bearing)
    }
    
    func testTurnLeftFromEast() {
        robot.orient(.East)
        robot.turnLeft()
        XCTAssertEqual(CardinalDirection.North, robot.bearing)
    }
    
    func testTurnLeftFromSouth() {
        robot.orient(.South)
        robot.turnLeft()
        XCTAssertEqual(CardinalDirection.East, robot.bearing)
    }
    
    func testTurnLeftFromWest() {
        robot.orient(.West)
        robot.turnLeft()
        XCTAssertEqual(CardinalDirection.South, robot.bearing)
    }

    func testRobotCoordinates() {
        robot.at(x: 3, y: 0)
        XCTAssertEqual([3, 0], robot.coordinates)
    }
    
    func testOtherRobotCoordinates() {
        robot.at(x: -2, y: 5)
        XCTAssertEqual([-2, 5], robot.coordinates)
    }
    
    func testAdvanceWhenFacingNorth() {
        robot.at(x: 0, y: 0)
        robot.orient(.North)
        robot.advance()
        XCTAssertEqual([0, 1], robot.coordinates)
    }
    
    func testAdvanceWhenFacingEast() {
        robot.at(x: 0, y: 0)
        robot.orient(.East)
        robot.advance()
        XCTAssertEqual([1, 0], robot.coordinates)
    }
    
    func testAdvanceWhenFacingSouth() {
        robot.at(x: 0, y: 0)
        robot.orient(.South)
        robot.advance()
        XCTAssertEqual([0, -1], robot.coordinates)
    }
    
    func testAdvanceWhenFacingWest() {
        robot.at(x: 0, y: 0)
        robot.orient(.West)
        robot.advance()
        XCTAssertEqual([-1, 0], robot.coordinates)
    }
    
    func testInstructionForTurningLeft() {
        XCTAssertEqual([.TurnLeft], simulator.instructions("L"))
    }
    
    func testInstructionForTurningRight() {
        XCTAssertEqual([.TurnRight], simulator.instructions("R"))
    }
    
    func testInstructionForAdvancing() {
        XCTAssertEqual([.Advance], simulator.instructions("A"))
    }
    
    func testSeriesOfInstructions() {
        XCTAssertEqual([.TurnRight, .Advance, .Advance, .TurnLeft], simulator.instructions("RAAL"))
    }
    
    func testInstructRobot() {
        let robot = SimulatedRobot()
        simulator.place(robot, x: -2, y: 1, direction: .East)
        simulator.evaluate(robot, commands: "RLAALAL")
        XCTAssertEqual([0, 2], robot.coordinates)
        XCTAssertEqual(CardinalDirection.West, robot.bearing)
    }
    
    func testInstructManyRobots() {
        let robot1 = SimulatedRobot()
        let robot2 = SimulatedRobot()
        let robot3 = SimulatedRobot()
        simulator.place(robot1, x: 0, y: 0, direction: .North)
        simulator.place(robot2, x: 2, y: -7, direction: .East)
        simulator.place(robot3, x: 8, y: 4, direction: .South)
        simulator.evaluate(robot1, commands: "LAAARALA")
        simulator.evaluate(robot2, commands: "RRAAAAALA")
        simulator.evaluate(robot3, commands: "LAAARRRALLLL")
        
        XCTAssertEqual([-4, 1], robot1.coordinates)
        XCTAssertEqual(CardinalDirection.West, robot1.bearing)
        
        XCTAssertEqual([-3, -8], robot2.coordinates)
        XCTAssertEqual(CardinalDirection.South, robot2.bearing)
        
        XCTAssertEqual([11, 5], robot3.coordinates)
        XCTAssertEqual(CardinalDirection.North, robot3.bearing)
    }
    
//        def test_instruct_robot
//        skip
//        robot = Robot.new
//        simulator.place(robot, x: -2, y: 1, direction: :east)
//        simulator.evaluate(robot, 'RLAALAL')
//        assert_equal [0, 2], robot.coordinates
//        assert_equal :west, robot.bearing
//        end
    
//        def test_instruct_many_robots # rubocop:disable Metrics/MethodLength
//        skip
//        robot1 = Robot.new
//        robot2 = Robot.new
//        robot3 = Robot.new
//        simulator.place(robot1, x: 0, y: 0, direction: :north)
//        simulator.place(robot2, x: 2, y: -7, direction: :east)
//        simulator.place(robot3, x: 8, y: 4, direction: :south)
//        simulator.evaluate(robot1, 'LAAARALA')
//        simulator.evaluate(robot2, 'RRAAAAALA')
//        simulator.evaluate(robot3, 'LAAARRRALLLL')
//        
//        assert_equal [-4, 1], robot1.coordinates
//        assert_equal :west, robot1.bearing
//        
//        assert_equal [-3, -8], robot2.coordinates
//        assert_equal :south, robot2.bearing
//        
//        assert_equal [11, 5], robot3.coordinates
//        assert_equal :north, robot3.bearing
//        end
//        end
    
}
