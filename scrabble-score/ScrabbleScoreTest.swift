import XCTest


class ScrambbleScoreTest: XCTestCase {
    
    
    func test_empty_word_scores_zero(){
        XCTAssertEqual( 0, Scrabble("").score)}
    
    func test_whitespace_scores_zero(){
        XCTAssertEqual( 0, Scrabble(" \t\n").score)}
    
    func test_nil_scores_zero(){
        XCTAssertEqual( 0, Scrabble(nil).score)}
    
    func test_scores_very_short_word(){
        XCTAssertEqual( 1, Scrabble("a").score)}
    
    func test_scores_other_very_short_word(){
        XCTAssertEqual( 4, Scrabble("f").score)}
    
    func test_simple_word_scores_the_number_of_letters(){
        XCTAssertEqual( 6, Scrabble("street").score)}
    
    func test_complicated_word_scores_more(){
        XCTAssertEqual( 22, Scrabble("quirky").score)}
    
    func test_scores_are_case_insensitive(){
        XCTAssertEqual( 20, Scrabble("MULTIBILLIONAIRE").score)}
    
    func test_convenient_scoring(){
        XCTAssertEqual( 13, Scrabble.score("alacrity"))}
    
}