import XCTest


class WordyTest: XCTestCase {
       
// Swift does not have native error handling but we can emulate it by using ?? and optionals
    var errorInt:Int = 0
    
func test_add_1(){
    XCTAssertEqual(2, WordProblem("What is 1 plus 1?").answer ?? errorInt)}

func test_add_2(){
    XCTAssertEqual(55, WordProblem("What is 53 plus 2?").answer ?? errorInt )}

func test_add_negative_numbers(){
    XCTAssertEqual(-11, WordProblem("What is -1 plus -10?").answer ?? errorInt ) }

func test_add_more_digits(){
    XCTAssertEqual(45_801, WordProblem("What is 123 plus 45678?").answer ?? errorInt )}

func test_subtract(){
    XCTAssertEqual(16, WordProblem("What is 4 minus -12?").answer ?? errorInt )}

func test_multiply(){
    XCTAssertEqual(-75, WordProblem("What is -3 multiplied by 25?").answer ?? errorInt) }

func test_divide(){
    XCTAssertEqual(-11, WordProblem("What is 33 divided by -3?").answer ?? errorInt) }

func test_add_twice(){
    let question = "What is 1 plus 1 plus 1?"
    XCTAssertEqual(3, WordProblem(question).answer ?? errorInt )}

func test_add_then_subtract(){
    let question = "What is 1 plus 5 minus -2?"
    XCTAssertEqual(8, WordProblem(question).answer ?? errorInt )}

func test_subtract_twice(){
    let question = "What is 20 minus 4 minus 13?"
    XCTAssertEqual(3, WordProblem(question).answer ?? errorInt )}

func test_subtract_then_add(){
    let question = "What is 17 minus 6 plus 3?"
    XCTAssertEqual(14, WordProblem(question).answer ?? errorInt )}

func test_multiply_twice(){
    let question = "What is 2 multiplied by -2 multiplied by 3?"
    XCTAssertEqual(-12, WordProblem(question).answer ?? errorInt) }

func test_add_then_multiply(){
    let question = "What is -3 plus 7 multiplied by -2?"
    XCTAssertEqual(-8, WordProblem(question).answer ?? errorInt) }

func test_divide_twice(){
    let question = "What is -12 divided by 2 divided by -3?"
    XCTAssertEqual(2, WordProblem(question).answer ?? errorInt )}

func test_too_advanced(){
    XCTAssertNil(WordProblem("What is 53 cubed?").answer)}

func test_irrelevant(){
    XCTAssertNil(WordProblem("Who is the president of the United States?").answer) }

}
