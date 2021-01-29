import XCTest
@testable import Series

private extension XCTest {
    func XCTAssertEqualMultiArray(_ aArray1: [[Int]], _ aArray2: [[Int]]) {
        XCTAssertEqual(Array(aArray1.joined()), Array(aArray2.joined()))
    }
}

class SeriesTests: XCTestCase {
    func testSimpleSlicesOfOne() {
        let series = Series("01234")
        XCTAssertEqualMultiArray([[0], [1], [2], [3], [4]], series.slices(1))
    }

    func testSimpleSlicesOfOneAgain() {
        let series = Series("92834")
        XCTAssertEqualMultiArray([[9], [2], [8], [3], [4]], series.slices(1))
    }

    func testSimpleSlicesOfTwo() {
        let series = Series("01234")
        XCTAssertEqualMultiArray([[0, 1], [1, 2], [2, 3], [3, 4]], series.slices(2))
    }

    func testOtherSlicesOfTwo() {
        let series = Series("98273463")
        let expected = [[9, 8], [8, 2], [2, 7], [7, 3], [3, 4], [4, 6], [6, 3]]
        XCTAssertEqualMultiArray(expected, series.slices(2))
    }

    func testSimpleSlicesOfTwoAgain() {
        let series = Series("37103")
        XCTAssertEqualMultiArray([[3, 7], [7, 1], [1, 0], [0, 3]], series.slices(2))
    }

    func testSimpleSlicesOfThree() {
        let series = Series("01234")
        XCTAssertEqualMultiArray([[0, 1, 2], [1, 2, 3], [2, 3, 4]], series.slices(3))
    }

    func testSimpleSlicesOfThreeAgain() {
        let series = Series("31001")
        XCTAssertEqualMultiArray([[3, 1, 0], [1, 0, 0], [0, 0, 1]], series.slices(3))
    }

    func testOtherSlicesOfThree() {
        let series = Series("982347")
        let expected = [[9, 8, 2], [8, 2, 3], [2, 3, 4], [3, 4, 7]]
        XCTAssertEqualMultiArray(expected, series.slices(3))
    }

    func testSimpleSlicesOfFour() {
        let series = Series("01234")
        XCTAssertEqualMultiArray([[0, 1, 2, 3], [1, 2, 3, 4]], series.slices(4))
    }

    func testSimpleSlicesOfFourAgain() {
        let series = Series("91274")
        XCTAssertEqualMultiArray([[9, 1, 2, 7], [1, 2, 7, 4]], series.slices(4))
    }

    func testSimpleSlicesOfFive() {
        let series = Series("01234")
        XCTAssertEqualMultiArray([[0, 1, 2, 3, 4]], series.slices(5))
    }

    func testSimpleSlicesOfFiveAgain() {
        let series = Series("81228")
        XCTAssertEqualMultiArray([[8, 1, 2, 2, 8]], series.slices(5))
    }

    func testSimpleSliceThatBlowsUp() {
        let series = Series("01234")
        XCTAssertEqualMultiArray([], series.slices(6))
    }

    func testMoreComplicatedSliceThatBlowsUp() {
        let sliceString = "01032987583"
        let series = Series(sliceString)
        XCTAssertEqualMultiArray([], series.slices(12))
    }

    static var allTests: [(String, (SeriesTests) -> () throws -> Void)] {
        return [
            ("testSimpleSlicesOfOne", testSimpleSlicesOfOne),
            ("testSimpleSlicesOfOneAgain", testSimpleSlicesOfOneAgain),
            ("testSimpleSlicesOfTwo", testSimpleSlicesOfTwo),
            ("testOtherSlicesOfTwo", testOtherSlicesOfTwo),
            ("testSimpleSlicesOfTwoAgain", testSimpleSlicesOfTwoAgain),
            ("testSimpleSlicesOfThree", testSimpleSlicesOfThree),
            ("testSimpleSlicesOfThreeAgain", testSimpleSlicesOfThreeAgain),
            ("testOtherSlicesOfThree", testOtherSlicesOfThree),
            ("testSimpleSlicesOfFour", testSimpleSlicesOfFour),
            ("testSimpleSlicesOfFourAgain", testSimpleSlicesOfFourAgain),
            ("testSimpleSlicesOfFive", testSimpleSlicesOfFive),
            ("testSimpleSlicesOfFiveAgain", testSimpleSlicesOfFiveAgain),
            ("testSimpleSliceThatBlowsUp", testSimpleSliceThatBlowsUp),
            ("testMoreComplicatedSliceThatBlowsUp", testMoreComplicatedSliceThatBlowsUp),
        ]
    }
}
