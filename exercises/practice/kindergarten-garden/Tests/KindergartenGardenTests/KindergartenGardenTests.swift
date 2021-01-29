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
        XCTAssertEqual([.radishes, .clover, .grass, .grass], garden.plantsForChild("Alice"))
    }

    func testDifferentGardenForAlice() {
        let garden = Garden("VC\nRC")
        XCTAssertEqual([.violets, .clover, .radishes, .clover], garden.plantsForChild("Alice"))
    }

    func testBobsGarden() {
        let garden = Garden("VVCG\nVVRC")
        XCTAssertEqual([.clover, .grass, .radishes, .clover], garden.plantsForChild("Bob"))
    }

    func testBobAndCharliesGardens() {
        let garden = Garden("VVCCGG\nVVCCGG")
        XCTAssertEqual([.clover, .clover, .clover, .clover], garden.plantsForChild("Bob"))
        XCTAssertEqual([.grass, .grass, .grass, .grass], garden.plantsForChild("Charlie"))
    }

    // MARK: - Test full garden

    func testAlice() {
        XCTAssertEqual([.violets, .radishes, .violets, .radishes], fullGarden.plantsForChild("Alice"))
    }

    func testBob() {
        XCTAssertEqual([.clover, .grass, .clover, .clover], fullGarden.plantsForChild("Bob"))
    }

    func testCharlie() {
        XCTAssertEqual([.violets, .violets, .clover, .grass], fullGarden.plantsForChild("Charlie"))
    }

    func testDavid() {
        XCTAssertEqual([.radishes, .violets, .clover, .radishes], fullGarden.plantsForChild("David"))
    }

    func testEve() {
        XCTAssertEqual([.clover, .grass, .radishes, .grass], fullGarden.plantsForChild("Eve"))
    }

    func testFred() {
        XCTAssertEqual([.grass, .clover, .violets, .clover], fullGarden.plantsForChild("Fred"))
    }

    func testGinny() {
        XCTAssertEqual([.clover, .grass, .grass, .clover], fullGarden.plantsForChild("Ginny"))
    }

    func testHarriet() {
        XCTAssertEqual([.violets, .radishes, .radishes, .violets], fullGarden.plantsForChild("Harriet"))
    }

    func testIleana() {
        XCTAssertEqual([.grass, .clover, .violets, .clover], fullGarden.plantsForChild("Ileana"))
    }

    func testJoseph() {
        XCTAssertEqual([.violets, .clover, .violets, .grass], fullGarden.plantsForChild("Joseph"))
    }

    func testKincaid() {
        XCTAssertEqual([.grass, .clover, .clover, .grass], fullGarden.plantsForChild("Kincaid"))
    }

    func testLarry() {
        XCTAssertEqual([.grass, .violets, .clover, .violets], fullGarden.plantsForChild("Larry"))
    }

    // MARK: - Test disordered garden

    func testPatricia() {
        XCTAssertEqual([.violets, .clover, .radishes, .violets], disorderedGarden.plantsForChild("Patricia"))
    }

    func testRoger() {
        XCTAssertEqual([.radishes, .radishes, .grass, .clover], disorderedGarden.plantsForChild("Roger"))
    }

    func testSamantha() {
        XCTAssertEqual([.grass, .violets, .clover, .grass], disorderedGarden.plantsForChild("Samantha"))
    }

    func testXander() {
        XCTAssertEqual([.radishes, .grass, .clover, .violets], disorderedGarden.plantsForChild("Xander"))
    }

    // MARK: - Test two gardens, different students

    func testBobAndCharliePerGarden() {
        XCTAssertEqual([.radishes, .radishes, .grass, .clover], garden1.plantsForChild("Bob"))
        XCTAssertEqual([.violets, .clover, .radishes, .violets], garden2.plantsForChild("Bob"))
        XCTAssertEqual([.grass, .violets, .clover, .grass], garden1.plantsForChild("Charlie"))
        XCTAssertEqual([.radishes, .radishes, .grass, .clover], garden2.plantsForChild("Charlie"))
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
