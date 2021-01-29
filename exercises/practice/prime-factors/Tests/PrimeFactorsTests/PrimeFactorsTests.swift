import XCTest
@testable import PrimeFactors

class PrimeFactorsTests: XCTestCase {
    func test1() {
        XCTAssertEqual([], PrimeFactors(1).toArray)
    }

    func test2() {
        XCTAssertEqual([2], PrimeFactors(2).toArray)
    }

    func test3() {
        XCTAssertEqual([3], PrimeFactors(3).toArray)
    }

    func test4() {
        XCTAssertEqual([2, 2], PrimeFactors(4).toArray)
    }

    func test6() {
        XCTAssertEqual([2, 3], PrimeFactors(6).toArray)
    }

    func test8() {
        XCTAssertEqual([2, 2, 2], PrimeFactors(8).toArray)
    }

    func test9() {
        XCTAssertEqual([3, 3], PrimeFactors(9).toArray)
    }

    func test27() {
        XCTAssertEqual([3, 3, 3], PrimeFactors(27).toArray)
    }

    func test625() {
        XCTAssertEqual([5, 5, 5, 5], PrimeFactors(625).toArray)
    }

    func test901255() {
        XCTAssertEqual([5, 17, 23, 461], PrimeFactors(901_255).toArray)
    }

    func test93819012551() {
        XCTAssertEqual([11, 9539, 894_119], PrimeFactors(93_819_012_551).toArray)
    }

    static var allTests: [(String, (PrimeFactorsTests) -> () throws -> Void)] {
        return [
            ("test1", test1),
            ("test2", test2),
            ("test3", test3),
            ("test4", test4),
            ("test6", test6),
            ("test8", test8),
            ("test9", test9),
            ("test27", test27),
            ("test625", test625),
            ("test901255", test901255),
            ("test93819012551", test93819012551),
        ]
    }
}
