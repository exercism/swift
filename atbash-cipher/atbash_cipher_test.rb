require "minitest/autorun"
require_relative "atbash"

# rubocop:disable Style/MethodName
class AtbashTest < MiniTest::Unit::TestCase
  func test_encode_no
    XCTAssertEqual("ml", Atbash.encode("no") )}

  func test_encode_yes(){
    XCTAssertEqual("bvh", Atbash.encode("yes") )}

  func test_encode_OMG(){
    XCTAssertEqual("lnt", Atbash.encode("OMG") )}

  func test_encode_O_M_G(){
    XCTAssertEqual("lnt", Atbash.encode("O M G") )}

  func test_encode_long_word(){
    XCTAssertEqual("nrmwy oldrm tob", Atbash.encode("mindblowingly") )}

  func test_encode_numbers(){
    XCTAssertEqual(("gvhgr mt123 gvhgr mt",
                 Atbash.encode("Testing, 1 2 3, testing.")) )}

  func test_encode_sentence(){
    XCTAssertEqual("gifgs rhurx grlm", Atbash.encode("Truth is fiction.") )}

  func test_encode_all_the_things(){
    plaintext = "The quick brown fox jumps over the lazy dog."
    cipher = "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
    XCTAssertEqual(cipher, Atbash.encode(plaintext) )}
end
