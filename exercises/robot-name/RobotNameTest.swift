#if swift(>=3.0)
    import XCTest
#endif

class RobotNameTest: XCTestCase {

    func robotNameIsCorrectlyFormatted(_ name: String) -> Bool {
        let robotNameRegex = try? NSRegularExpression(pattern: "\\A\\w{2}\\d{3}\\z", options: NSRegularExpression.Options.caseInsensitive)
        guard let matches = robotNameRegex?.matches(in: name, options: .withoutAnchoringBounds, range: NSMakeRange(0, name.characters.count)) else { return false }

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
