import XCTest
@testable import PythagoreanTriplet

class PythagoreanTripletTests: XCTestCase {
    func testSum() {
        XCTAssertEqual(12, Triplet(3, 4, 5).sum)
    }

    func testProduct() {
        XCTAssertEqual(60, Triplet(3, 4, 5).product)
    }

    func testPythagorean() {
        XCTAssertTrue(Triplet(3, 4, 5).isPythagorean)
    }

    func testNotPythagorean() {
        XCTAssertTrue(!Triplet(5, 6, 7).isPythagorean)
    }

    func testTripletsUpTo10() {
        let triplets = Triplet.fromWhere(maxFactor: 10)
        let products = triplets.map { $0.product }.sorted(by: <)
        XCTAssertEqual([60, 480], products)
    }

    func testTripletsFrom11UpTo20() {
        let triplets = Triplet.fromWhere(11, maxFactor: 20)
        let products = triplets.map { $0.product }.sorted(by: <)
        XCTAssertEqual([3840], products)
    }

    func testTripletsWhereSumX() {
        let triplets = Triplet.fromWhere( maxFactor: 100, sum: 180)
        let products = triplets.map { $0.product }.sorted(by: <)
        XCTAssertEqual([118_080, 168_480, 202_500], products)
    }

    static var allTests: [(String, (PythagoreanTripletTests) -> () throws -> Void)] {
        return [
            ("testSum", testSum),
            ("testProduct", testProduct),
            ("testPythagorean", testPythagorean),
            ("testNotPythagorean", testNotPythagorean),
            ("testTripletsUpTo10", testTripletsUpTo10),
            ("testTripletsFrom11UpTo20", testTripletsFrom11UpTo20),
            ("testTripletsWhereSumX", testTripletsWhereSumX),
        ]
    }
}
