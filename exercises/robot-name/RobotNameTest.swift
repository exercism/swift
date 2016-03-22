import XCTest



class RobotNameTest: XCTestCase {

    func robotNameIsCorrectlyFormatted(name: String) -> Bool {
        let robotNameRegex = try? NSRegularExpression(pattern: "\\A\\w{2}\\d{3}\\z", options: NSRegularExpressionOptions.CaseInsensitive)
        guard let matches = robotNameRegex?.matchesInString(name, options: .WithoutAnchoringBounds, range: NSMakeRange(0, name.characters.count)) else { return false }

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
}
