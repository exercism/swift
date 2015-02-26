import Foundation
import XCTest


class PythagoreanTripletTest: XCTestCase {
    func test_sum(){
    XCTAssertEqual(12, Triplet(3, 4, 5).sum )}

func test_product(){
    XCTAssertEqual(60, Triplet(3, 4, 5).product )}

func test_pythagorean(){
    XCTAssertTrue(Triplet(3, 4, 5).isPythagorean )}

func test_not_pythagorean(){
    XCTAssertTrue(!Triplet(5, 6, 7).isPythagorean )}

func test_triplets_upto_10(){
    var triplets = Triplet.Where(maxFactor: 10)
    var products = triplets.map{$0.product}.sorted(<)
    XCTAssertEqual([60, 480], products )}

func test_triplets_from_11_upto_20(){
    var triplets = Triplet.Where(minFactor: 11, maxFactor: 20)
    var products = triplets.map{$0.product}.sorted(<)
    XCTAssertEqual([3840], products )}

func test_triplets_where_sum_x(){
    var triplets = Triplet.Where( maxFactor: 100, sum: 180)
    var products = triplets.map{$0.product}.sorted(<)
    XCTAssertEqual([118_080, 168_480, 202_500], products )}


}

