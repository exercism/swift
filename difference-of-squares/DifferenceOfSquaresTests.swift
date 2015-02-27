import Foundation
import XCTest


class DifferenceOfSquaresTests: XCTestCase {
    
func test_squareOfSums_to_5(){
    XCTAssertEqual(225, Squares(5).squareOfSums )}

func test_sumOfSquares_to_5(){
    XCTAssertEqual(55, Squares(5).sumOfSquares )}

func test_differenceOfSquares_of_sums_to_5(){
    XCTAssertEqual(170, Squares(5).differenceOfSquares )}

func test_squareOfSums_to_10(){
    XCTAssertEqual(3025, Squares(10).squareOfSums )}

func test_sumOfSquares_to_10(){
    XCTAssertEqual(385, Squares(10).sumOfSquares )}

func test_differenceOfSquares_of_sums_to_10(){
    XCTAssertEqual(2640, Squares(10).differenceOfSquares )}

func test_squareOfSums_to_100(){
    XCTAssertEqual(25_502_500, Squares(100).squareOfSums )}

func test_sumOfSquares_to_100(){
    XCTAssertEqual(338_350, Squares(100).sumOfSquares )}

func test_differenceOfSquares_of_sums_to_100(){
    XCTAssertEqual(25_164_150, Squares(100).differenceOfSquares )}


}