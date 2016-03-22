
import XCTest




class PythagoreanTripletTest: XCTestCase {
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
        let triplets = Triplet.Where(maxFactor: 10)
        let products = triplets.map{$0.product}.sort(<)
        XCTAssertEqual([60, 480], products)
    }
    
    func testTripletsFrom11UpTo20() {
        let triplets = Triplet.Where(11, maxFactor: 20)
        let products = triplets.map{$0.product}.sort(<)
        XCTAssertEqual([3840], products)
    }
    
    func testTripletsWhereSumX() {
        let triplets = Triplet.Where( maxFactor: 100, sum: 180)
        let products = triplets.map{$0.product}.sort(<)
        XCTAssertEqual([118_080, 168_480, 202_500], products)
    }
    
    
}

