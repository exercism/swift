import XCTest
@testable import RobotSimulator

class RobotSimulatorTests: XCTestCase {
    var robot = SimulatedRobot()

    func testRobotBearingEast() {
        robot.orient(.east)
        XCTAssertEqual([.east], [robot.bearing])
    }

    func testRobotBearingWest() {
        robot.orient(.west)
        XCTAssertEqual([.west], [robot.bearing])
    }

    func testRobotBearingNorth() {
        robot.orient(.north)
        XCTAssertEqual([.north], [robot.bearing])
    }

    func testRobotBearingSouth() {
        robot.orient(.south)
        XCTAssertEqual([.south], [robot.bearing])
    }

    func testTurnRightFromNorth() {
        robot.orient(.north)
        robot.turnRight()
        XCTAssertEqual([.east], [robot.bearing])
    }

    func testTurnRightFromEast() {
        robot.orient(.east)
        robot.turnRight()
        XCTAssertEqual([.south], [robot.bearing])
    }

    func testTurnRightFromSouth() {
        robot.orient(.south)
        robot.turnRight()
        XCTAssertEqual([.west], [robot.bearing])
    }

    func testTurnRightFromWest() {
        robot.orient(.west)
        robot.turnRight()
        XCTAssertEqual([.north], [robot.bearing])
    }

    func testTurnLeftFromNorth() {
        robot.orient(.north)
        robot.turnLeft()
        XCTAssertEqual([.west], [robot.bearing])
    }

    func testTurnLeftFromEast() {
        robot.orient(.east)
        robot.turnLeft()
        XCTAssertEqual([.north], [robot.bearing])
    }

    func testTurnLeftFromSouth() {
        robot.orient(.south)
        robot.turnLeft()
        XCTAssertEqual([.east], [robot.bearing])
    }

    func testTurnLeftFromWest() {
        robot.orient(.west)
        robot.turnLeft()
        XCTAssertEqual([.south], [robot.bearing])
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
        robot.orient(.north)
        robot.advance()
        XCTAssertEqual([0, 1], robot.coordinates)
    }

    func testAdvanceWhenFacingEast() {
        robot.at(x: 0, y: 0)
        robot.orient(.east)
        robot.advance()
        XCTAssertEqual([1, 0], robot.coordinates)
    }

    func testAdvanceWhenFacingSouth() {
        robot.at(x: 0, y: 0)
        robot.orient(.south)
        robot.advance()
        XCTAssertEqual([0, -1], robot.coordinates)
    }

    func testAdvanceWhenFacingWest() {
        robot.at(x: 0, y: 0)
        robot.orient(.west)
        robot.advance()
        XCTAssertEqual([-1, 0], robot.coordinates)
    }

    func testInstructionForTurningLeft() {
        XCTAssertEqual([.turnLeft], robot.instructions("L"))
    }

    func testInstructionForTurningRight() {
        XCTAssertEqual([.turnRight], robot.instructions("R"))
    }

    func testInstructionForAdvancing() {
        XCTAssertEqual([.advance], robot.instructions("A"))
    }

    func testSeriesOfInstructions() {
        XCTAssertEqual([.turnRight, .advance, .advance, .turnLeft], robot.instructions("RAAL"))
    }

    func testInstructRobot() {
        var robot = SimulatedRobot()
        robot.place(x: -2, y: 1, direction: .east)
        robot.evaluate("RLAALAL")

        XCTAssertEqual([0, 2], robot.coordinates)
        XCTAssertEqual([.west], [robot.bearing])
    }

    func testInstructManyRobots() {
        var robot1 = SimulatedRobot()
        var robot2 = SimulatedRobot()
        var robot3 = SimulatedRobot()
        robot1.place(x: 0, y: 0, direction: .north)
        robot2.place(x: 2, y: -7, direction: .east)
        robot3.place(x: 8, y: 4, direction: .south)
        robot1.evaluate("LAAARALA")
        robot2.evaluate("RRAAAAALA")
        robot3.evaluate("LAAARRRALLLL")

        XCTAssertEqual([-4, 1], robot1.coordinates)
        XCTAssertEqual([.west], [robot1.bearing])

        XCTAssertEqual([-3, -8], robot2.coordinates)
        XCTAssertEqual([.south], [robot2.bearing])

        XCTAssertEqual([11, 5], robot3.coordinates)
        XCTAssertEqual([.north], [robot3.bearing])
    }

    static var allTests: [(String, (RobotSimulatorTests) -> () throws -> Void)] {
        return [
            ("testRobotBearingEast", testRobotBearingEast),
            ("testRobotBearingWest", testRobotBearingWest),
            ("testRobotBearingNorth", testRobotBearingNorth),
            ("testRobotBearingSouth", testRobotBearingSouth),
            ("testTurnRightFromNorth", testTurnRightFromNorth),
            ("testTurnRightFromEast", testTurnRightFromEast),
            ("testTurnRightFromSouth", testTurnRightFromSouth),
            ("testTurnRightFromWest", testTurnRightFromWest),
            ("testTurnLeftFromNorth", testTurnLeftFromNorth),
            ("testTurnLeftFromEast", testTurnLeftFromEast),
            ("testTurnLeftFromSouth", testTurnLeftFromSouth),
            ("testTurnLeftFromWest", testTurnLeftFromWest),
            ("testRobotCoordinates", testRobotCoordinates),
            ("testOtherRobotCoordinates", testOtherRobotCoordinates),
            ("testAdvanceWhenFacingNorth", testAdvanceWhenFacingNorth),
            ("testAdvanceWhenFacingEast", testAdvanceWhenFacingEast),
            ("testAdvanceWhenFacingSouth", testAdvanceWhenFacingSouth),
            ("testAdvanceWhenFacingWest", testAdvanceWhenFacingWest),
            ("testInstructionForTurningLeft", testInstructionForTurningLeft),
            ("testInstructionForTurningRight", testInstructionForTurningRight),
            ("testInstructionForAdvancing", testInstructionForAdvancing),
            ("testSeriesOfInstructions", testSeriesOfInstructions),
            ("testInstructRobot", testInstructRobot),
            ("testInstructManyRobots", testInstructManyRobots),
        ]
    }
}
