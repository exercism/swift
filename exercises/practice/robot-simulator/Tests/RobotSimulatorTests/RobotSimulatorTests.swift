import XCTest

@testable import RobotSimulator

class RobotSimulatorTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testAtOriginFacingNorth1() {
    var robot = SimulatedRobot(x: 0, y: 0, bearing: .north)
    robot.move(commands: "")
    let state = robot.state
    XCTAssertTrue(state.x == 0 && state.y == 0 && state.bearing == .north)
  }

  func testAtNegativePositionFacingSouth1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var robot = SimulatedRobot(x: -1, y: -1, bearing: .south)
    robot.move(commands: "")
    let state = robot.state
    XCTAssertTrue(state.x == -1 && state.y == -1 && state.bearing == .south)
  }

  func testChangesNorthToEast2() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var robot = SimulatedRobot(x: 0, y: 0, bearing: .north)
    robot.move(commands: "R")
    let state = robot.state
    XCTAssertTrue(state.x == 0 && state.y == 0 && state.bearing == .east)
  }

  func testChangesEastToSouth2() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var robot = SimulatedRobot(x: 0, y: 0, bearing: .east)
    robot.move(commands: "R")
    let state = robot.state
    XCTAssertTrue(state.x == 0 && state.y == 0 && state.bearing == .south)
  }

  func testChangesSouthToWest2() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var robot = SimulatedRobot(x: 0, y: 0, bearing: .south)
    robot.move(commands: "R")
    let state = robot.state
    XCTAssertTrue(state.x == 0 && state.y == 0 && state.bearing == .west)
  }

  func testChangesWestToNorth2() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var robot = SimulatedRobot(x: 0, y: 0, bearing: .west)
    robot.move(commands: "R")
    let state = robot.state
    XCTAssertTrue(state.x == 0 && state.y == 0 && state.bearing == .north)
  }

  func testChangesNorthToWest3() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var robot = SimulatedRobot(x: 0, y: 0, bearing: .north)
    robot.move(commands: "L")
    let state = robot.state
    XCTAssertTrue(state.x == 0 && state.y == 0 && state.bearing == .west)
  }

  func testChangesWestToSouth3() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var robot = SimulatedRobot(x: 0, y: 0, bearing: .west)
    robot.move(commands: "L")
    let state = robot.state
    XCTAssertTrue(state.x == 0 && state.y == 0 && state.bearing == .south)
  }

  func testChangesSouthToEast3() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var robot = SimulatedRobot(x: 0, y: 0, bearing: .south)
    robot.move(commands: "L")
    let state = robot.state
    XCTAssertTrue(state.x == 0 && state.y == 0 && state.bearing == .east)
  }

  func testChangesEastToNorth3() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var robot = SimulatedRobot(x: 0, y: 0, bearing: .east)
    robot.move(commands: "L")
    let state = robot.state
    XCTAssertTrue(state.x == 0 && state.y == 0 && state.bearing == .north)
  }

  func testFacingNorthIncrementsY4() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var robot = SimulatedRobot(x: 0, y: 0, bearing: .north)
    robot.move(commands: "A")
    let state = robot.state
    XCTAssertTrue(state.x == 0 && state.y == 1 && state.bearing == .north)
  }

  func testFacingSouthDecrementsY4() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var robot = SimulatedRobot(x: 0, y: 0, bearing: .south)
    robot.move(commands: "A")
    let state = robot.state
    XCTAssertTrue(state.x == 0 && state.y == -1 && state.bearing == .south)
  }

  func testFacingEastIncrementsX4() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var robot = SimulatedRobot(x: 0, y: 0, bearing: .east)
    robot.move(commands: "A")
    let state = robot.state
    XCTAssertTrue(state.x == 1 && state.y == 0 && state.bearing == .east)
  }

  func testFacingWestDecrementsX4() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var robot = SimulatedRobot(x: 0, y: 0, bearing: .west)
    robot.move(commands: "A")
    let state = robot.state
    XCTAssertTrue(state.x == -1 && state.y == 0 && state.bearing == .west)
  }

  func testMovingEastAndNorthFromReadme5() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var robot = SimulatedRobot(x: 7, y: 3, bearing: .north)
    robot.move(commands: "RAALAL")
    let state = robot.state
    XCTAssertTrue(state.x == 9 && state.y == 4 && state.bearing == .west)
  }

  func testMovingWestAndNorth5() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var robot = SimulatedRobot(x: 0, y: 0, bearing: .north)
    robot.move(commands: "LAAARALA")
    let state = robot.state
    XCTAssertTrue(state.x == -4 && state.y == 1 && state.bearing == .west)
  }

  func testMovingWestAndSouth5() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var robot = SimulatedRobot(x: 2, y: -7, bearing: .east)
    robot.move(commands: "RRAAAAALA")
    let state = robot.state
    XCTAssertTrue(state.x == -3 && state.y == -8 && state.bearing == .south)
  }

  func testMovingEastAndNorth5() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var robot = SimulatedRobot(x: 8, y: 4, bearing: .south)
    robot.move(commands: "LAAARRRALLLL")
    let state = robot.state
    XCTAssertTrue(state.x == 11 && state.y == 5 && state.bearing == .north)
  }
}
