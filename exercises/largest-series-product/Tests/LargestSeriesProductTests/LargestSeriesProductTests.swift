import XCTest
@testable import LargestSeriesProduct

class LargestSeriesProductTests: XCTestCase {

    func testCanFindTheLargestProductOf2WithNumbersInOrder() {
        XCTAssertEqual(72, try? NumberSeries("0123456789").largestProduct(2))
    }

    func testCanFindTheLargestProductOf2() {
        XCTAssertEqual(48, try? NumberSeries("576802143").largestProduct(2))
    }

    func testFindsTheLargestProductIfSpanEqualsLength() {
        XCTAssertEqual(18, try? NumberSeries("29").largestProduct(2))
    }

    func testCanFindTheLargestProductOf3WithNumbersInOrder() {
        XCTAssertEqual(504, try? NumberSeries("0123456789").largestProduct(3))
    }

    func testCanFindTheLargestProductOf3() {
        XCTAssertEqual(270, try? NumberSeries("1027839564").largestProduct(3))
    }

    func testCanFindTheLargestProductOf5WithNumbersInOrder() {
        XCTAssertEqual(15120, try? NumberSeries("0123456789").largestProduct(5))
    }

    func testCanGetTheLargestProductOfABigNumber() {
        XCTAssertEqual(23520, try? NumberSeries("73167176531330624919225119674426574742355349194934").largestProduct(6))
    }

    func testCanGetTheLargestProductOfAnotherBigNumber() {
        XCTAssertEqual(28350, try? NumberSeries("52677741234314237566414902593461595376319419139427").largestProduct(6))
    }

    func testCanGetTheLargestProductOfABigNumberProjectEuler() {
        XCTAssertEqual(23514624000, try? NumberSeries("7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450").largestProduct(13))
    }

    func testReportsZeroIfTheOnlyDigitsAreZero() {
        XCTAssertEqual(0, try? NumberSeries("0000").largestProduct(2))
    }

    func testReportsZeroIfAllSpansIncludeZero() {
        XCTAssertEqual(0, try? NumberSeries("99099").largestProduct(3))
    }

    func testRejectsSpanLongerThanStringLength() {
        XCTAssertThrowsError(_ = try NumberSeries("123").largestProduct(4)) { error in
            XCTAssertEqual(error as? NumberSeries.NumberSeriesError, .spanLongerThanStringLength)
        }
    }

    func testReports1ForEmptyStringAndEmptyProduct0Span() {
        XCTAssertEqual(1, try? NumberSeries("").largestProduct(0))
    }

    func testReports1ForNonemptyStringAndEmptyProduct0Span() {
        XCTAssertEqual(1, try? NumberSeries("123").largestProduct(0))
    }

    func testRejectsEmptyStringAndNonzeroSpan() {
        XCTAssertThrowsError(_ = try NumberSeries("").largestProduct(1)) { error in
            XCTAssertEqual(error as? NumberSeries.NumberSeriesError, .spanLongerThanStringLength)
        }
    }

    func testRejectsInvalidCharacterInDigits() {
        XCTAssertThrowsError(_ = try NumberSeries("1234a5").largestProduct(2)) { error in
            XCTAssertEqual(error as? NumberSeries.NumberSeriesError, .invalidCharacter)
        }
    }

    func testRejectsNegativeSpan() {
        XCTAssertThrowsError(_ = try NumberSeries("12345").largestProduct(-1)) { error in
            XCTAssertEqual(error as? NumberSeries.NumberSeriesError, .negativeSpan)
        }
    }

    static var allTests: [(String, (LargestSeriesProductTests) -> () throws -> Void)] {
        return [
            ("testCanFindTheLargestProductOf2WithNumbersInOrder", testCanFindTheLargestProductOf2WithNumbersInOrder),
            ("testCanFindTheLargestProductOf2", testCanFindTheLargestProductOf2),
            ("testFindsTheLargestProductIfSpanEqualsLength", testFindsTheLargestProductIfSpanEqualsLength),
            ("testCanFindTheLargestProductOf3WithNumbersInOrder", testCanFindTheLargestProductOf3WithNumbersInOrder),
            ("testCanFindTheLargestProductOf3", testCanFindTheLargestProductOf3),
            ("testCanFindTheLargestProductOf5WithNumbersInOrder", testCanFindTheLargestProductOf5WithNumbersInOrder),
            ("testCanGetTheLargestProductOfABigNumber", testCanGetTheLargestProductOfABigNumber),
            ("testCanGetTheLargestProductOfAnotherBigNumber", testCanGetTheLargestProductOfAnotherBigNumber),
            ("testCanGetTheLargestProductOfABigNumberProjectEuler", testCanGetTheLargestProductOfABigNumberProjectEuler),
            ("testReportsZeroIfTheOnlyDigitsAreZero", testReportsZeroIfTheOnlyDigitsAreZero),
            ("testReportsZeroIfAllSpansIncludeZero", testReportsZeroIfAllSpansIncludeZero),
            ("testRejectsSpanLongerThanStringLength", testRejectsSpanLongerThanStringLength),
            ("testReports1ForEmptyStringAndEmptyProduct0Span", testReports1ForEmptyStringAndEmptyProduct0Span),
            ("testReports1ForNonemptyStringAndEmptyProduct0Span", testReports1ForNonemptyStringAndEmptyProduct0Span),
            ("testRejectsEmptyStringAndNonzeroSpan", testRejectsEmptyStringAndNonzeroSpan),
            ("testRejectsInvalidCharacterInDigits", testRejectsInvalidCharacterInDigits),
            ("testRejectsNegativeSpan", testRejectsNegativeSpan),
        ]
    }
}
