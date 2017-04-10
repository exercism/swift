import XCTest
import Foundation
@testable import RobotName

#if os(Linux)
#if swift(>=3.1)
    typealias Regex = NSRegularExpression
#else
    typealias Regex = RegularExpression
#endif
#else
    typealias Regex = NSRegularExpression
#endif

class RobotNameTests: XCTestCase {
    func robotNameIsCorrectlyFormatted(_ name: String) -> Bool {
        let robotNameRegex = try? Regex(pattern: "\\A\\w{2}\\d{3}\\z", options: Regex.Options.caseInsensitive)
        guard let matches = robotNameRegex?.matches(in: name, options: .withoutAnchoringBounds, range: NSRange(0..<name.utf16.count)) else { return false }

        return matches.count > 0
    }

    func testHasName() {
        let robot = Robot()
        XCTAssert(robotNameIsCorrectlyFormatted(robot.name))
    }

    func testNameSticks() {
        let robot = Robot()
        let name = robot.name
        XCTAssertEqual(name, robot.name)
    }

    func testDifferentRobotsHaveDifferentNames() {
        let firstRobot = Robot()
        let secondRobot = Robot()
        XCTAssertNotEqual(firstRobot.name, secondRobot.name)
    }

    func testResetName() {
        var robot = Robot()
        let firstName = robot.name
        robot.resetName()
        let secondName = robot.name
        XCTAssertNotEqual(firstName, secondName)
    }

    static var allTests: [(String, (RobotNameTests) -> () throws -> Void)] {
        return [
            ("testHasName", testHasName),
            ("testNameSticks", testNameSticks),
            ("testDifferentRobotsHaveDifferentNames", testDifferentRobotsHaveDifferentNames),
            ("testResetName", testResetName),
        ]
    }
}
