import XCTest
import UIKit

class  RomanNumeralsTest: XCTestCase {
    func test_1(){
        XCTAssertTrue("I" == 1.toRoman)}
    
    func test_2(){
        XCTAssertTrue("II" == 2.toRoman)}
    
    func test_3(){
        XCTAssertTrue("III" == 3.toRoman)}
    
    func test_4(){
        XCTAssertTrue("IV" == 4.toRoman)}
    
    func test_5(){
        XCTAssertTrue("V" == 5.toRoman)}
    
    func test_6(){
        XCTAssertTrue("VI" == 6.toRoman)}
    
    func test_9(){
        XCTAssertTrue("IX" == 9.toRoman)}
    
    func test_27(){
        XCTAssertTrue("XXVII" == 27.toRoman)}
    
    func test_48(){
        XCTAssertTrue("XLVIII" == 48.toRoman)}
    
    func test_59(){
        XCTAssertTrue("LIX" == 59.toRoman)}
    
    func test_93(){
        XCTAssertTrue("XCIII" == 93.toRoman)}
    
    func test_141(){
        XCTAssertTrue("CXLI" == 141.toRoman)}
    
    func test_163(){
        XCTAssertTrue("CLXIII" == 163.toRoman)}
    
    func test_402(){
        XCTAssertTrue("CDII" == 402.toRoman)}
    
    func test_575(){
        XCTAssertTrue("DLXXV" == 575.toRoman)}
    
    func test_911(){
        XCTAssertTrue("CMXI" == 911.toRoman)}
    
    func test_1024(){
        XCTAssertTrue("MXXIV" == 1024.toRoman)}
    
    func test_3000(){
        XCTAssertTrue("MMM" == 3000.toRoman)}
    
}
