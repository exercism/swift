import XCTest

@testable import FreelancerRates

/// Tests the correctness of `FreelancerRates` functions outcomes
final class FreelancerRatesTests: XCTestCase {

    // MARK: - Instance Properties

    /// Triggers the `passthrough` testing pipe
    private let runAll = Bool(
        ProcessInfo.processInfo.environment["RUNALL", default: "false"]
    ) ?? false

    /// Calculations accuracy threshold
    /// - Note: This can be potentially discussible as no strict rules defined for the rounding
    private let accuracy = 0.001

    // MARK: - Tests

    /// Tests that user `dailyRateFrom(hourlyRate:)` imp produces expected outcome
    func testdailyRateFrom() {

        // Arrange
        let userResult = dailyRateFrom(hourlyRate: 60)
        let expectedResult: Double = 480

        // Assert
        XCTAssertEqual(
            userResult,
            expectedResult,
            accuracy: 0.001,
            "Your dailyRate func returned \(userResult), while \(480) was expected"
        )
    }

    /// Tests that user `monthlyRateFrom(hourlyRate:,discount:)` imp produces expected outcome
    func testmonthlyRoundDown() throws {

        // Arrange
        let userResult = monthlyRateFrom(
            hourlyRate: 77,
            withDiscount: 10.5
        )
        let expectedResult: Double = 12129

        // Act
        /// Change `true` to `false` to run this test
        try XCTSkipIf(false && !runAll)

        // Assert
        XCTAssertEqual(
            userResult,
            expectedResult,
            accuracy: 0.001,
            "Your monthly func returned \(userResult), while \(expectedResult) was expected"
        )
    }

    /// Tests that user `monthlyRateFrom(hourlyRate:discount:)` imp rounds correctly
    ///  - Note: Do we really need so precise accuracy, maybe we can hust match vs. `Int`?
    func testmonthlyRoundUp() throws {

        // Arrange
        let userResult = monthlyRateFrom(
            hourlyRate: 80,
            withDiscount: 10.5
        )
        let expectedResult: Double = 12602

        // Act
        /// Change `true` to `false` to run this test
        try XCTSkipIf(false && !runAll)

        // Assert
        XCTAssertEqual(
            userResult,
            expectedResult,
            accuracy: 0.001,
            "Your monthly func returned \(userResult), while \(expectedResult) was expected"
        )
    }

    /// Tests that user `workdaysIn(budget:hourlyRate:discount:)` imp produces expected outcome
    func testworkdaysIn() throws {

        // Arrange
        let userResult = workdaysIn(
            budget: 20_000,
            hourlyRate: 80,
            withDiscount: 11
        )
        let expectedResult: Double = 35

        // Act
        /// Change `true` to `false` to run this test
        try XCTSkipIf(false && !runAll)

        // Assert
        XCTAssertEqual(
            userResult,
            expectedResult,
            accuracy: 0.001,
            "Your workday func returned \(userResult), while \(expectedResult) was expected"
        )
    }

    /// Tests that user `workdaysIn(budget:hourlyRate:discount:)` imp rounds correctly
    func testworkdaysShouldRoundDown() throws {

        // Arrange
        let userResult = workdaysIn(
            budget: 25_000,
            hourlyRate: 80,
            withDiscount: 11
        )
        let expectedResult: Double = 43

        // Act
        /// Change `true` to `false` to run this test
        try XCTSkipIf(false && !runAll)

        // Assert
        XCTAssertEqual(
            userResult,
            expectedResult,
            accuracy: 0.001,
            "Your workday func returned \(userResult), while \(expectedResult) was expected"
        )
    }

    static var allTests = [
        ("testdailyRateFrom", testdailyRateFrom),
        ("testmonthlyRoundDown", testmonthlyRoundDown),
        ("testmonthlyRoundUp", testmonthlyRoundUp),
        ("testworkdaysIn", testworkdaysIn),
        ("testworkdaysShouldRoundDown", testworkdaysShouldRoundDown)
    ]
}
