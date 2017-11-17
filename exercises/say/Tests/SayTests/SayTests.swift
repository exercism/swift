import XCTest
@testable import Say

class SayTests: XCTestCase {

    func testZero() {
        XCTAssertEqual("zero", Say.say(0))
    }

    func testOne() {
        XCTAssertEqual("one", Say.say(1))
    }

    func testFourteen() {
        XCTAssertEqual("fourteen", Say.say(14))
    }

    func testTwenty() {
        XCTAssertEqual("twenty", Say.say(20))
    }

    func testTwentyTwo() {
        XCTAssertEqual("twenty-two", Say.say(22))
    }

    func testOneHundred() {
        XCTAssertEqual("one hundred", Say.say(100))
    }

    func testOneHundredTwentyThree() {
        XCTAssertEqual("one hundred twenty-three", Say.say(123))
    }

    func testOneThousand() {
        XCTAssertEqual("one thousand", Say.say(1_000))
    }

    func testOneThousandTwoHundredThirtyFour() {
        XCTAssertEqual("one thousand two hundred thirty-four", Say.say(1_234))
    }

    func testOneMillion() {
        XCTAssertEqual("one million", Say.say(1_000_000))
    }

    func testOneMillionTwoThousandThreeHundredFortyFive() {
        XCTAssertEqual("one million two thousand three hundred forty-five", Say.say(1_002_345))
    }

    func testOneBillion() {
        XCTAssertEqual("one billion", Say.say(1_000_000_000))
    }

    func testABigNumber() {
        XCTAssertEqual("nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three", Say.say(987_654_321_123))
    }

    func testNumbersBelowZeroAreOutOfRange() {
        XCTAssertNil(Say.say(-1))
    }

    func testNumbersAbove999999999999AreOutOfRange() {
        XCTAssertNil(Say.say(1_000_000_000_000))
    }

    static var allTests: [(String, (SayTests) -> () throws -> Void)] {
        return [
            ("testZero", testZero),
            ("testOne", testOne),
            ("testFourteen", testFourteen),
            ("testTwenty", testTwenty),
            ("testTwentyTwo", testTwentyTwo),
            ("testOneHundred", testOneHundred),
            ("testOneHundredTwentyThree", testOneHundredTwentyThree),
            ("testOneThousand", testOneThousand),
            ("testOneThousandTwoHundredThirtyFour", testOneThousandTwoHundredThirtyFour),
            ("testOneMillion", testOneMillion),
            ("testOneMillionTwoThousandThreeHundredFortyFive", testOneMillionTwoThousandThreeHundredFortyFive),
            ("testOneBillion", testOneBillion),
            ("testABigNumber", testABigNumber),
            ("testNumbersBelowZeroAreOutOfRange", testNumbersBelowZeroAreOutOfRange),
            ("testNumbersAbove999999999999AreOutOfRange", testNumbersAbove999999999999AreOutOfRange),
        ]
    }
}
