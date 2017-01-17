import XCTest
@testable import KindergartenGarden

class KindergartenGardenTests: XCTestCase {
    private let fullGarden = Garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    private let disorderedGarden = Garden("VCRRGVRG\nRVGCCGCV", children: ["Samantha", "Patricia", "Xander", "Roger"])
    private static let diagram = "VCRRGVRG\nRVGCCGCV"
    private let garden1 = Garden(diagram, children: ["Alice", "Bob", "Charlie", "Dan"])
    private let garden2 = Garden(diagram, children: ["Bob", "Charlie", "Dan", "Erin"])

    func testAlicesGarden() {
        let garden = Garden("RC\nGG")
        XCTAssertEqual([.Radishes, .Clover, .Grass, .Grass], garden.plantsForChild("Alice"))
    }

    func testDifferentGardenForAlice() {
        let garden = Garden("VC\nRC")
        XCTAssertEqual([.Violets, .Clover, .Radishes, .Clover], garden.plantsForChild("Alice"))
    }

    func testBobsGarden() {
        let garden = Garden("VVCG\nVVRC")
        XCTAssertEqual([.Clover, .Grass, .Radishes, .Clover], garden.plantsForChild("Bob"))
    }

    func testBobAndCharliesGardens() {
        let garden = Garden("VVCCGG\nVVCCGG")
        XCTAssertEqual([.Clover, .Clover, .Clover, .Clover], garden.plantsForChild("Bob"))
        XCTAssertEqual([.Grass, .Grass, .Grass, .Grass], garden.plantsForChild("Charlie"))
    }

    // MARK: - Test full garden

    func testAlice() {
        XCTAssertEqual([.Violets, .Radishes, .Violets, .Radishes], fullGarden.plantsForChild("Alice"))
    }

    func testBob() {
        XCTAssertEqual([.Clover, .Grass, .Clover, .Clover], fullGarden.plantsForChild("Bob"))
    }

    func testCharlie() {
        XCTAssertEqual([.Violets, .Violets, .Clover, .Grass], fullGarden.plantsForChild("Charlie"))
    }

    func testDavid() {
        XCTAssertEqual([.Radishes, .Violets, .Clover, .Radishes], fullGarden.plantsForChild("David"))
    }

    func testEve() {
        XCTAssertEqual([.Clover, .Grass, .Radishes, .Grass], fullGarden.plantsForChild("Eve"))
    }

    func testFred() {
        XCTAssertEqual([.Grass, .Clover, .Violets, .Clover], fullGarden.plantsForChild("Fred"))
    }

    func testGinny() {
        XCTAssertEqual([.Clover, .Grass, .Grass, .Clover], fullGarden.plantsForChild("Ginny"))
    }

    func testHarriet() {
        XCTAssertEqual([.Violets, .Radishes, .Radishes, .Violets], fullGarden.plantsForChild("Harriet"))
    }

    func testIleana() {
        XCTAssertEqual([.Grass, .Clover, .Violets, .Clover], fullGarden.plantsForChild("Ileana"))
    }

    func testJoseph() {
        XCTAssertEqual([.Violets, .Clover, .Violets, .Grass], fullGarden.plantsForChild("Joseph"))
    }

    func testKincaid() {
        XCTAssertEqual([.Grass, .Clover, .Clover, .Grass], fullGarden.plantsForChild("Kincaid"))
    }

    func testLarry() {
        XCTAssertEqual([.Grass, .Violets, .Clover, .Violets], fullGarden.plantsForChild("Larry"))
    }

    // MARK: - Test disordered garden

    func testPatricia() {
        XCTAssertEqual([.Violets, .Clover, .Radishes, .Violets], disorderedGarden.plantsForChild("Patricia"))
    }

    func testRoger() {
        XCTAssertEqual([.Radishes, .Radishes, .Grass, .Clover], disorderedGarden.plantsForChild("Roger"))
    }

    func testSamantha() {
        XCTAssertEqual([.Grass, .Violets, .Clover, .Grass], disorderedGarden.plantsForChild("Samantha"))
    }

    func testXander() {
        XCTAssertEqual([.Radishes, .Grass, .Clover, .Violets], disorderedGarden.plantsForChild("Xander"))
    }

    // MARK: - Test two gardens, different students

    func testBobAndCharliePerGarden() {
        XCTAssertEqual([.Radishes, .Radishes, .Grass, .Clover], garden1.plantsForChild("Bob"))
        XCTAssertEqual([.Violets, .Clover, .Radishes, .Violets], garden2.plantsForChild("Bob"))
        XCTAssertEqual([.Grass, .Violets, .Clover, .Grass], garden1.plantsForChild("Charlie"))
        XCTAssertEqual([.Radishes, .Radishes, .Grass, .Clover], garden2.plantsForChild("Charlie"))
    }

    static var allTests: [(String, (KindergartenGardenTests) -> () throws -> Void)] {
        return [
            ("testAlicesGarden", testAlicesGarden),
            ("testDifferentGardenForAlice", testDifferentGardenForAlice),
            ("testBobsGarden", testBobsGarden),
            ("testBobAndCharliesGardens", testBobAndCharliesGardens),
            ("testAlice", testAlice),
            ("testBob", testBob),
            ("testCharlie", testCharlie),
            ("testDavid", testDavid),
            ("testEve", testEve),
            ("testFred", testFred),
            ("testGinny", testGinny),
            ("testHarriet", testHarriet),
            ("testIleana", testIleana),
            ("testJoseph", testJoseph),
            ("testKincaid", testKincaid),
            ("testLarry", testLarry),
            ("testPatricia", testPatricia),
            ("testRoger", testRoger),
            ("testSamantha", testSamantha),
            ("testXander", testXander),
            ("testBobAndCharliePerGarden", testBobAndCharliePerGarden),
        ]
    }
}
