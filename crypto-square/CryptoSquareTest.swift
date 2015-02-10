import XCTest

class CryptoSquareTest: XCTestCase {
    
    func test_normalize_strange_characters(){
        var crypto = Crypto("s#$%^&plunk")
        XCTAssertEqual("splunk", crypto.normalizePlaintext )}
        
    func test_normalize_uppercase_characters(){
        var crypto = Crypto("WHOA HEY!")
        XCTAssertEqual("whoahey", crypto.normalizePlaintext )}
    
    func test_normalize_with_numbers(){
        var crypto = Crypto("1, 2, 3 GO!")
        XCTAssertEqual("123go", crypto.normalizePlaintext )}
    
    func test_size_of_small_square(){
        var crypto = Crypto("1234")
        XCTAssertEqual(2, crypto.size )}

    func test_size_of_slightly_larger_square(){
        var crypto = Crypto("123456789")
        XCTAssertEqual(3, crypto.size )}
    
    func test_size_of_non_perfect_square(){
        var crypto = Crypto("123456789abc")
        XCTAssertEqual(4, crypto.size )}
    
    func test_size_is_determined_by_normalized_plaintext(){
        var crypto = Crypto("Oh hey, this is nuts!")
        XCTAssertEqual(4, crypto.size )}
    
    func test_plaintextSegments(){
        var crypto = Crypto("Never vex thine heart with idle woes")
        let expected = ["neverv", "exthin", "eheart", "withid", "lewoes"]
        XCTAssertEqual(expected, crypto.plaintextSegments )}

    func test_other_plaintextSegments(){
        var crypto = Crypto("ZOMG! ZOMBIES!!!")
        XCTAssertEqual(["zomg", "zomb", "ies"], crypto.plaintextSegments )}

    func test_ciphertext(){
        var crypto = Crypto("Time is an illusion. Lunchtime doubly so.")
        XCTAssertEqual("tasneyinicdsmiohooelntuillibsuuml", crypto.ciphertext )}

    func test_another_ciphertext(){
        var crypto = Crypto("We all know interspecies romance is weird.")
        XCTAssertEqual("wneiaweoreneawssciliprerlneoidktcms", crypto.ciphertext )}
    
    func test_normalized_ciphertext(){
        var crypto = Crypto("Vampires are people too!")
        XCTAssertEqual("vrel aepe mset paoo irpo", crypto.normalizeCiphertext )}
    
    func test_normalized_ciphertext_spills_into_short_segment(){
        var crypto = Crypto("Madness, and then illumination.")
        XCTAssertEqual("msemo aanin dninn dlaet ltshu i", crypto.normalizeCiphertext )}
    
    func test_another_normalized_ciphertext(){
        var crypto = Crypto(
            "If man was meant to stay on the ground god would have given us roots"
        )
       var  expected = "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghns seoau"
        XCTAssertEqual(expected, crypto.normalizeCiphertext )}
    
    func test_normalized_ciphertext_with_punctuation(){
        var crypto = Crypto("Have a nice day. Feed the dog & chill out!")
        let expected = "hifei acedl veeol eddgo aatcu nyhht"
        XCTAssertEqual(expected, crypto.normalizeCiphertext )}
    
    
}