import Foundation
import XCTest

class RnaTranscriptionTest: XCTestCase {
    
func test_Rna_complement_of_cytosine_is_guanine(){
    XCTAssertEqual("G", Nucleotide("C").complementOfDNA )}

func test_Rna_complement_of_guanine_is_cytosine(){
    XCTAssertEqual("C", Nucleotide("G").complementOfDNA )}

func test_Rna_complement_of_thymine_is_adenine(){
    XCTAssertEqual("A", Nucleotide("T").complementOfDNA )}

func test_Rna_complement_of_adenine_is_uracil(){
    XCTAssertEqual("U", Nucleotide("A").complementOfDNA )}

func test_Rna_complement(){
    XCTAssertEqual("UGCACCAGAAUU", Nucleotide("ACGTGGTCTTAA").complementOfDNA )}

func test_Dna_complement_of_cytosine_is_guanine(){
    XCTAssertEqual("G", Nucleotide("C").complementOfRNA )}

func test_Dna_complement_of_guanine_is_cytosine(){
    XCTAssertEqual("C", Nucleotide("G").complementOfRNA )}

func test_Dna_complement_of_uracil_is_adenine(){
    XCTAssertEqual("A", Nucleotide("U").complementOfRNA )}

func test_Dna_complement_of_adenine_is_thymine(){
    XCTAssertEqual("T", Nucleotide("A").complementOfRNA )}

func test_Dna_complement(){
    XCTAssertEqual("ACTTGGGCTGTAC", Nucleotide("UGAACCCGACAUG").complementOfRNA )}

}
