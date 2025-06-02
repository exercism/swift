import Foundation
import Testing

@testable import RobotName

typealias Regex = NSRegularExpression

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct RobotNameTests {
  func robotNameIsCorrectlyFormatted(_ name: String) -> Bool {
    let robotNameRegex = try? Regex(pattern: "\\A[A-Z]{2}\\d{3}\\z")
    guard
      let matches = robotNameRegex?.matches(
        in: name, options: .withoutAnchoringBounds, range: NSRange(0..<name.utf16.count))
    else { return false }

    return matches.count > 0
  }

  @Test("Test if the robot name is correctly formatted")
  func testHasName() {
    let robot = Robot()
    #expect(robotNameIsCorrectlyFormatted(robot.name))
  }

  @Test("Test if the robot name is the same after multiple calls", .enabled(if: RUNALL))
  func testNameSticks() {
    let robot = Robot()
    let name = robot.name
    #expect(name == robot.name)
  }

  @Test("Test if different robots have different names", .enabled(if: RUNALL))
  func testDifferentRobotsHaveDifferentNames() {
    let firstRobot = Robot()
    let secondRobot = Robot()
    #expect(firstRobot.name != secondRobot.name)
  }

  @Test("Test if the robot name can be reset", .enabled(if: RUNALL))
  func testResetName() {
    var robot = Robot()
    let firstName = robot.name
    robot.resetName()
    let secondName = robot.name
    #expect(firstName != secondName)
  }
}
