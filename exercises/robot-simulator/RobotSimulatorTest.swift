import XCTest



class RobotSimulatorTest: XCTestCase {
    
    var robot = SimulatedRobot()    
    
    func testRobotBearingEast() {
        robot.orient(.East)
        XCTAssertEqual([.East], [robot.bearing])
    }
    
    func testRobotBearingWest() {
        robot.orient(.West)
        XCTAssertEqual([.West], [robot.bearing])
    }

    func testRobotBearingNorth() {
        robot.orient(.North)
        XCTAssertEqual([.North], [robot.bearing])
    }
    
    func testRobotBearingSouth() {
        robot.orient(.South)
        XCTAssertEqual([.South], [robot.bearing])
    }
    
    func testTurnRightFromNorth() {
        robot.orient(.North)
        robot.turnRight()
        XCTAssertEqual([.East], [robot.bearing])
    }
    
    func testTurnRightFromEast() {
        robot.orient(.East)
        robot.turnRight()
        XCTAssertEqual([.South], [robot.bearing])
    }
    
    func testTurnRightFromSouth() {
        robot.orient(.South)
        robot.turnRight()
        XCTAssertEqual([.West], [robot.bearing])
    }
    
    func testTurnRightFromWest() {
        robot.orient(.West)
        robot.turnRight()
        XCTAssertEqual([.North], [robot.bearing])
    }
    
    func testTurnLeftFromNorth() {
        robot.orient(.North)
        robot.turnLeft()
        XCTAssertEqual([.West], [robot.bearing])
    }
    
    func testTurnLeftFromEast() {
        robot.orient(.East)
        robot.turnLeft()
        XCTAssertEqual([.North], [robot.bearing])
    }
    
    func testTurnLeftFromSouth() {
        robot.orient(.South)
        robot.turnLeft()
        XCTAssertEqual([.East], [robot.bearing])
    }
    
    func testTurnLeftFromWest() {
        robot.orient(.West)
        robot.turnLeft()
        XCTAssertEqual([.South], [robot.bearing])
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
        XCTAssertEqual([.TurnLeft], robot.instructions("L"))
    }
    
    func testInstructionForTurningRight() {
        XCTAssertEqual([.TurnRight], robot.instructions("R"))
    }
    
    func testInstructionForAdvancing() {
        XCTAssertEqual([.Advance], robot.instructions("A"))
    }
    
    func testSeriesOfInstructions() {
        XCTAssertEqual([.TurnRight, .Advance, .Advance, .TurnLeft], robot.instructions("RAAL"))
    }
    
    func testInstructRobot() {
        var robot = SimulatedRobot()
        robot.place(x: -2, y: 1, direction: .East)
        robot.evaluate("RLAALAL")
        
        XCTAssertEqual([0, 2], robot.coordinates)
        XCTAssertEqual([.West], [robot.bearing])
    }
    
    func testInstructManyRobots() {
        var robot1 = SimulatedRobot()
        var robot2 = SimulatedRobot()
        var robot3 = SimulatedRobot()
        robot1.place(x: 0, y: 0, direction: .North)
        robot2.place(x: 2, y: -7, direction: .East)
        robot3.place(x: 8, y: 4, direction: .South)
        robot1.evaluate("LAAARALA")
        robot2.evaluate("RRAAAAALA")
        robot3.evaluate("LAAARRRALLLL")
        
        XCTAssertEqual([-4, 1], robot1.coordinates)
        XCTAssertEqual([.West], [robot1.bearing])
        
        XCTAssertEqual([-3, -8], robot2.coordinates)
        XCTAssertEqual([.South], [robot2.bearing])
        
        XCTAssertEqual([11, 5], robot3.coordinates)
        XCTAssertEqual([.North], [robot3.bearing])
    }
        
}
