import XCTest


class SeriesTest: XCTestCase {

func test_simple_slices_of_one(){
    var series = Series("01234")
    XCTAssertEqual([[0], [1], [2], [3], [4]], series.slices(1) )}

func test_simple_slices_of_one_again(){
    var series = Series("92834")
    XCTAssertEqual([[9], [2], [8], [3], [4]], series.slices(1) )}

func test_simple_slices_of_two(){
    let series = Series("01234")
    XCTAssertEqual([[0, 1], [1, 2], [2, 3], [3, 4]], series.slices(2) )}

func test_other_slices_of_two(){
    let series = Series("98273463")
    let expected = [[9, 8], [8, 2], [2, 7], [7, 3], [3, 4], [4, 6], [6, 3]]
    XCTAssertEqual(expected, series.slices(2) )}

func test_simple_slices_of_two_again(){
    let series = Series("37103")
    XCTAssertEqual([[3, 7], [7, 1], [1, 0], [0, 3]], series.slices(2) )}

func test_simple_slices_of_three(){
    let series = Series("01234")
    XCTAssertEqual([[0, 1, 2], [1, 2, 3], [2, 3, 4]], series.slices(3) )}

func test_simple_slices_of_three_again(){
    let series = Series("31001")
    XCTAssertEqual([[3, 1, 0], [1, 0, 0], [0, 0, 1]], series.slices(3) )}

func test_other_slices_of_three(){
    let series = Series("982347")
    let expected = [[9, 8, 2], [8, 2, 3], [2, 3, 4], [3, 4, 7]]
    XCTAssertEqual(expected, series.slices(3) )}

func test_simple_slices_of_four(){
    let series = Series("01234")
    XCTAssertEqual([[0, 1, 2, 3], [1, 2, 3, 4]], series.slices(4) )}

func test_simple_slices_of_four_again(){
    let series = Series("91274")
    XCTAssertEqual([[9, 1, 2, 7], [1, 2, 7, 4]], series.slices(4) )}

func test_simple_slices_of_five(){
    let series = Series("01234")
    XCTAssertEqual([[0, 1, 2, 3, 4]], series.slices(5) )}

func test_simple_slices_of_five_again(){
    let series = Series("81228")
    XCTAssertEqual([[8, 1, 2, 2, 8]], series.slices(5) )}

func test_simple_slice_that_blows_up(){
    let series = Series("01234")
    XCTAssertEqual([],series.slices(6))
    }

func test_more_complicated_slice_that_blows_up(){
    let slice_string = "01032987583"
    let series = Series(slice_string)
    XCTAssertEqual([], series.slices(12))
    }

}