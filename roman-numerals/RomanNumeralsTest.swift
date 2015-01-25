import XCTest
import UIKit

class  RomanNumeralsTest: XCTestCase {
    func test_1(){
        XCTAssertEqual("I", 1.toRoman)}
    
    func test_2(){
        XCTAssertEqual("II", 2.toRoman)}
    
    func test_3(){
        XCTAssertEqual("III", 3.toRoman)}
    
    func test_4(){
        XCTAssertEqual("IV", 4.toRoman)}
    
    func test_5(){
        XCTAssertEqual("V", 5.toRoman)}
    
    func test_6(){
        XCTAssertEqual("VI", 6.toRoman)}
    
    func test_9(){
        XCTAssertEqual("IX", 9.toRoman)}
    
    func test_27(){
        XCTAssertEqual("XXVII", 27.toRoman)}
    
    func test_48(){
        XCTAssertEqual("XLVIII", 48.toRoman)}
    
    func test_59(){
        XCTAssertEqual("LIX", 59.toRoman)}
    
    func test_93(){
        XCTAssertEqual("XCIII", 93.toRoman)}
    
    func test_141(){
        XCTAssertEqual("CXLI", 141.toRoman)}
    
    func test_163(){
        XCTAssertEqual("CLXIII", 163.toRoman)}
    
    func test_402(){
        XCTAssertEqual("CDII", 402.toRoman)}
    
    func test_575(){
        XCTAssertEqual("DLXXV", 575.toRoman)}
    
    func test_911(){
        XCTAssertEqual("CMXI", 911.toRoman)}
    
    func test_1024(){
        XCTAssertEqual("MXXIV", 1024.toRoman)}
    
    func test_3000(){
        XCTAssertEqual("MMM", 3000.toRoman)}
    
}
