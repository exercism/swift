import XCTest
@testable import Triangle

class TriangleTests: XCTestCase {
    let triangleKind = (Equilateral:"Equilateral", Isosceles:"Isosceles", Scalene:"Scalene", ErrorKind:"ErrorKind")
    func testEquilateralTrianglesHaveEqualSides() {
        XCTAssertEqual(triangleKind.Equilateral, Triangle(2, 2, 2).kind)
    }

    func testLargerEquilateralTrianglesAlsoHaveEqualSides() {
        XCTAssertEqual(triangleKind.Equilateral, Triangle(10, 10, 10).kind)
    }

    func testIsoscelesTrianglesHaveLastTwoSidesEqual() {
        XCTAssertEqual(triangleKind.Isosceles, Triangle(3, 4, 4).kind)
    }

    func testIsoscelesTrianglesHaveFirstAndLastSidesEqual() {
        XCTAssertEqual(triangleKind.Isosceles, Triangle(4, 3, 4).kind)
    }

    func testIsoscelesTrianglesHaveTwoFirstSidesEqual() {
        XCTAssertEqual(triangleKind.Isosceles, Triangle(4, 4, 3).kind)
    }

    func testIsoscelesTrianglesHaveInFactExactlyTwoSidesEqual() {
        XCTAssertEqual(triangleKind.Isosceles, Triangle(10, 10, 2).kind)
    }

    func testScaleneTrianglesHaveNoEqualSides() {
        XCTAssertEqual(triangleKind.Scalene, Triangle(3, 4, 5).kind)
    }

    func testScaleneTrianglesHaveNoEqualSidesAtALargerScaleToo() {
        XCTAssertEqual(triangleKind.Scalene, Triangle(10, 11, 12).kind)
    }

    func testScaleneTrianglesHaveNoEqualSidesInDescendingOrderEither() {
        XCTAssertEqual(triangleKind.Scalene, Triangle(5, 4, 2).kind)
    }

    func testVerySmallTrianglesAreLegal() {
        XCTAssertEqual(triangleKind.Scalene, Triangle(0.4, 0.6, 0.3).kind)
    }

    func testTrianglesWithNoSizeAreIllegal() {
        XCTAssertEqual(triangleKind.ErrorKind, Triangle(0, 0, 0).kind)
    }

    func testTrianglesWithNegativeSidesAreIllegal() {
        XCTAssertEqual(triangleKind.ErrorKind, Triangle(3, 4, -5).kind)
    }

    func testTrianglesViolatingTriangleInequalityAreIllegal() {
        XCTAssertEqual(triangleKind.ErrorKind, Triangle(1, 1, 3).kind)
    }

    func testTrianglesViolatingTriangleInequalityAreIllegal3() {
        XCTAssertEqual(triangleKind.ErrorKind, Triangle(7, 3, 2).kind)
    }

    static var allTests: [(String, (TriangleTests) -> () throws -> Void)] {
        return [
            ("testEquilateralTrianglesHaveEqualSides", testEquilateralTrianglesHaveEqualSides),
            ("testLargerEquilateralTrianglesAlsoHaveEqualSides", testLargerEquilateralTrianglesAlsoHaveEqualSides),
            ("testIsoscelesTrianglesHaveLastTwoSidesEqual", testIsoscelesTrianglesHaveLastTwoSidesEqual),
            ("testIsoscelesTrianglesHaveFirstAndLastSidesEqual", testIsoscelesTrianglesHaveFirstAndLastSidesEqual),
            ("testIsoscelesTrianglesHaveTwoFirstSidesEqual", testIsoscelesTrianglesHaveTwoFirstSidesEqual),
            ("testIsoscelesTrianglesHaveInFactExactlyTwoSidesEqual", testIsoscelesTrianglesHaveInFactExactlyTwoSidesEqual),
            ("testScaleneTrianglesHaveNoEqualSides", testScaleneTrianglesHaveNoEqualSides),
            ("testScaleneTrianglesHaveNoEqualSidesAtALargerScaleToo", testScaleneTrianglesHaveNoEqualSidesAtALargerScaleToo),
            ("testScaleneTrianglesHaveNoEqualSidesInDescendingOrderEither", testScaleneTrianglesHaveNoEqualSidesInDescendingOrderEither),
            ("testVerySmallTrianglesAreLegal", testVerySmallTrianglesAreLegal),
            ("testTrianglesWithNoSizeAreIllegal", testTrianglesWithNoSizeAreIllegal),
            ("testTrianglesWithNegativeSidesAreIllegal", testTrianglesWithNegativeSidesAreIllegal),
            ("testTrianglesViolatingTriangleInequalityAreIllegal", testTrianglesViolatingTriangleInequalityAreIllegal),
            ("testTrianglesViolatingTriangleInequalityAreIllegal3", testTrianglesViolatingTriangleInequalityAreIllegal3),
        ]
    }
}
