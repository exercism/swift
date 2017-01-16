import XCTest
@testable import Raindrops

class RaindropsTests: XCTestCase {
    func test1() {
        XCTAssertEqual("1", Raindrops(1).sounds)
    }

    func test3() {
        XCTAssertEqual("Pling", Raindrops(3).sounds)
    }

    func test5() {
        XCTAssertEqual("Plang", Raindrops(5).sounds)
    }

    func test7() {
        XCTAssertEqual("Plong", Raindrops(7).sounds)
    }

    func test6() {
        XCTAssertEqual("Pling", Raindrops(6).sounds)
    }

    func test9() {
        XCTAssertEqual("Pling", Raindrops(9).sounds)
    }

    func test10() {
        XCTAssertEqual("Plang", Raindrops(10).sounds)
    }

    func test14() {
        XCTAssertEqual("Plong", Raindrops(14).sounds)
    }

    func test15() {
        XCTAssertEqual("PlingPlang", Raindrops(15).sounds)
    }

    func test21() {
        XCTAssertEqual("PlingPlong", Raindrops(21).sounds)
    }

    func test25() {
        XCTAssertEqual("Plang", Raindrops(25).sounds)
    }

    func test35() {
        XCTAssertEqual("PlangPlong", Raindrops(35).sounds)
    }

    func test49() {
        XCTAssertEqual("Plong", Raindrops(49).sounds)
    }

    func test52() {
        XCTAssertEqual("52", Raindrops(52).sounds)
    }

    func test105() {
        XCTAssertEqual("PlingPlangPlong", Raindrops(105).sounds)
    }

    func test12121() {
        XCTAssertEqual("12121", Raindrops(12_121).sounds)
    }

    static var allTests: [(String, (RaindropsTests) -> () throws -> Void)] {
        return [
            ("test1", test1),
            ("test3", test3),
            ("test5", test5),
            ("test7", test7),
            ("test6", test6),
            ("test9", test9),
            ("test10", test10),
            ("test14", test14),
            ("test15", test15),
            ("test21", test21),
            ("test25", test25),
            ("test35", test35),
            ("test49", test49),
            ("test52", test52),
            ("test105", test105),
            ("test12121", test12121),
        ]
    }
}
