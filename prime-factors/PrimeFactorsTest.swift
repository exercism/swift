import XCTest


class BlankTest: XCTestCase {
    
func test_1(){
    XCTAssertEqual([], PrimeFactors.For(1) )}

func test_2(){
    XCTAssertEqual([2] , PrimeFactors.For(2) )}

func test_3(){
    XCTAssertEqual([3], PrimeFactors.For(3) )}

func test_4(){
    XCTAssertEqual([2, 2], PrimeFactors.For(4) )}

func test_6(){
    XCTAssertEqual([2, 3], PrimeFactors.For(6) )}

func test_8(){
    XCTAssertEqual([2, 2, 2], PrimeFactors.For(8) )}

func test_9(){
    XCTAssertEqual([3, 3], PrimeFactors.For(9) )}

func test_27(){
    XCTAssertEqual([3, 3, 3], PrimeFactors.For(27) )}

func test_625(){
    XCTAssertEqual([5, 5, 5, 5], PrimeFactors.For(625) )}

func test_901255(){
    XCTAssertEqual([5, 17, 23, 461], PrimeFactors.For(901_255) )}

func test_93819012551(){
    XCTAssertEqual([11, 9539, 894_119], PrimeFactors.For(93_819_012_551) )}



 }

