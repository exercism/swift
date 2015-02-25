import Foundation
import XCTest

class PigLatinTest : XCTestCase {
    
    
func test_word_beginning_with_a(){
    XCTAssertEqual("appleay", PigLatin.translate("apple") )}

func test_other_word_beginning_e(){
    XCTAssertEqual("earay", PigLatin.translate("ear") )}

func test_word_beginning_with_p(){
    XCTAssertEqual("igpay", PigLatin.translate("pig") )}

func test_word_beginning_with_k(){
    XCTAssertEqual("oalakay", PigLatin.translate("koala") )}

func test_word_beginning_with_ch(){
    XCTAssertEqual("airchay", PigLatin.translate("chair") )}

func test_word_beginning_with_qu(){
    XCTAssertEqual("eenquay", PigLatin.translate("queen") )}

func test_word_with_consonant_preceding_qu(){
    XCTAssertEqual("aresquay", PigLatin.translate("square") )}

func test_word_beginning_with_th(){
    XCTAssertEqual("erapythay", PigLatin.translate("therapy") )}

func test_word_beginning_with_thr(){
    XCTAssertEqual("ushthray", PigLatin.translate("thrush") )}

func test_word_beginning_with_sch(){
    XCTAssertEqual("oolschay", PigLatin.translate("school") )}

func test_word_beginning_with_ye(){
    XCTAssertEqual("ellowyay", PigLatin.translate("yellow") )}

func test_word_beginning_with_yt(){
    XCTAssertEqual("yttriaay", PigLatin.translate("yttria") )}

func test_word_beginning_with_xe(){
    XCTAssertEqual("enonxay", PigLatin.translate("xenon") )}

func test_word_beginning_with_xr(){
    XCTAssertEqual("xrayay", PigLatin.translate("xray") )}
    
func test_translates_phrase(){
    XCTAssertEqual("ickquay astfay unray", PigLatin.translate("quick fast run") )}

    }