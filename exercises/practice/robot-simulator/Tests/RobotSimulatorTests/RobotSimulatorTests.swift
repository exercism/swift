import Foundation
import Testing

@testable import RobotSimulator

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "true"]) ?? false

@Suite struct RobotSimulatorTests {

  @Test("at origin facing north")
  func testAtOriginFacingNorth1() {
    var robot = SimulatedRobot(x: 0, y: 0, bearing: .north)
    robot.move(commands: "")
    let state = robot.state
    #expect(state.x == 0 && state.y == 0 && state.bearing == .north)
  }

  @Test("at negative position facing south", .enabled(if: RUNALL))
  func testAtNegativePositionFacingSouth1() {
    var robot = SimulatedRobot(x: -1, y: -1, bearing: .south)
    robot.move(commands: "")
    let state = robot.state
    #expect(state.x == -1 && state.y == -1 && state.bearing == .south)
  }

  @Test("changes north to east", .enabled(if: RUNALL))
  func testChangesNorthToEast2() {
    var robot = SimulatedRobot(x: 0, y: 0, bearing: .north)
    robot.move(commands: "R")
    let state = robot.state
    #expect(state.x == 0 && state.y == 0 && state.bearing == .east)
  }

  @Test("changes east to south", .enabled(if: RUNALL))
  func testChangesEastToSouth2() {
    var robot = SimulatedRobot(x: 0, y: 0, bearing: .east)
    robot.move(commands: "R")
    let state = robot.state
    #expect(state.x == 0 && state.y == 0 && state.bearing == .south)
  }

  @Test("changes south to west", .enabled(if: RUNALL))
  func testChangesSouthToWest2() {
    var robot = SimulatedRobot(x: 0, y: 0, bearing: .south)
    robot.move(commands: "R")
    let state = robot.state
    #expect(state.x == 0 && state.y == 0 && state.bearing == .west)
  }

  @Test("changes west to north", .enabled(if: RUNALL))
  func testChangesWestToNorth2() {
    var robot = SimulatedRobot(x: 0, y: 0, bearing: .west)
    robot.move(commands: "R")
    let state = robot.state
    #expect(state.x == 0 && state.y == 0 && state.bearing == .north)
  }

  @Test("changes north to west", .enabled(if: RUNALL))
  func testChangesNorthToWest3() {
    var robot = SimulatedRobot(x: 0, y: 0, bearing: .north)
    robot.move(commands: "L")
    let state = robot.state
    #expect(state.x == 0 && state.y == 0 && state.bearing == .west)
  }

  @Test("changes west to south", .enabled(if: RUNALL))
  func testChangesWestToSouth3() {
    var robot = SimulatedRobot(x: 0, y: 0, bearing: .west)
    robot.move(commands: "L")
    let state = robot.state
    #expect(state.x == 0 && state.y == 0 && state.bearing == .south)
  }

  @Test("changes south to east", .enabled(if: RUNALL))
  func testChangesSouthToEast3() {
    var robot = SimulatedRobot(x: 0, y: 0, bearing: .south)
    robot.move(commands: "L")
    let state = robot.state
    #expect(state.x == 0 && state.y == 0 && state.bearing == .east)
  }

  @Test("changes east to north", .enabled(if: RUNALL))
  func testChangesEastToNorth3() {
    var robot = SimulatedRobot(x: 0, y: 0, bearing: .east)
    robot.move(commands: "L")
    let state = robot.state
    #expect(state.x == 0 && state.y == 0 && state.bearing == .north)
  }

  @Test("facing north increments Y", .enabled(if: RUNALL))
  func testFacingNorthIncrementsY4() {
    var robot = SimulatedRobot(x: 0, y: 0, bearing: .north)
    robot.move(commands: "A")
    let state = robot.state
    #expect(state.x == 0 && state.y == 1 && state.bearing == .north)
  }

  @Test("facing south decrements Y", .enabled(if: RUNALL))
  func testFacingSouthDecrementsY4() {
    var robot = SimulatedRobot(x: 0, y: 0, bearing: .south)
    robot.move(commands: "A")
    let state = robot.state
    #expect(state.x == 0 && state.y == -1 && state.bearing == .south)
  }

  @Test("facing east increments X", .enabled(if: RUNALL))
  func testFacingEastIncrementsX4() {
    var robot = SimulatedRobot(x: 0, y: 0, bearing: .east)
    robot.move(commands: "A")
    let state = robot.state
    #expect(state.x == 1 && state.y == 0 && state.bearing == .east)
  }

  @Test("facing west decrements X", .enabled(if: RUNALL))
  func testFacingWestDecrementsX4() {
    var robot = SimulatedRobot(x: 0, y: 0, bearing: .west)
    robot.move(commands: "A")
    let state = robot.state
    #expect(state.x == -1 && state.y == 0 && state.bearing == .west)
  }

  @Test("moving east and north from README", .enabled(if: RUNALL))
  func testMovingEastAndNorthFromReadme5() {
    var robot = SimulatedRobot(x: 7, y: 3, bearing: .north)
    robot.move(commands: "RAALAL")
    let state = robot.state
    #expect(state.x == 9 && state.y == 4 && state.bearing == .west)
  }

  @Test("moving west and north", .enabled(if: RUNALL))
  func testMovingWestAndNorth5() {
    var robot = SimulatedRobot(x: 0, y: 0, bearing: .north)
    robot.move(commands: "LAAARALA")
    let state = robot.state
    #expect(state.x == -4 && state.y == 1 && state.bearing == .west)
  }

  @Test("moving west and south", .enabled(if: RUNALL))
  func testMovingWestAndSouth5() {
    var robot = SimulatedRobot(x: 2, y: -7, bearing: .east)
    robot.move(commands: "RRAAAAALA")
    let state = robot.state
    #expect(state.x == -3 && state.y == -8 && state.bearing == .south)
  }

  @Test("moving east and north", .enabled(if: RUNALL))
  func testMovingEastAndNorth5() {
    var robot = SimulatedRobot(x: 8, y: 4, bearing: .south)
    robot.move(commands: "LAAARRRALLLL")
    let state = robot.state
    #expect(state.x == 11 && state.y == 5 && state.bearing == .north)
  }
}
