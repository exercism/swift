import XCTest


class RaindropsTest: XCTestCase {
    
func test_1(){
    XCTAssertEqual("1", Raindrops.convert(1) )}

func test_3(){
    XCTAssertEqual("Pling", Raindrops.convert(3) )}

func test_5(){
    XCTAssertEqual("Plang", Raindrops.convert(5) )}

func test_7(){
    XCTAssertEqual("Plong", Raindrops.convert(7) )}

func test_6(){
    XCTAssertEqual("Pling", Raindrops.convert(6) )}

func test_9(){
    XCTAssertEqual("Pling", Raindrops.convert(9) )}

func test_10(){
    XCTAssertEqual("Plang", Raindrops.convert(10) )}

func test_14(){
    XCTAssertEqual("Plong", Raindrops.convert(14) )}

func test_15(){
    XCTAssertEqual("PlingPlang", Raindrops.convert(15) )}

func test_21(){
    XCTAssertEqual("PlingPlong", Raindrops.convert(21) )}

func test_25(){
    XCTAssertEqual("Plang", Raindrops.convert(25) )}

func test_35(){
    XCTAssertEqual("PlangPlong", Raindrops.convert(35) )}

func test_49(){
    XCTAssertEqual("Plong", Raindrops.convert(49) )}

func test_52(){
    XCTAssertEqual("52", Raindrops.convert(52) )}

func test_105(){
    XCTAssertEqual("PlingPlangPlong", Raindrops.convert(105) )}

func test_12121(){
    XCTAssertEqual("12121", Raindrops.convert(12_121) )}

 }

