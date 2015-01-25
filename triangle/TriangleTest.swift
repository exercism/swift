import XCTest


class TriangleTest: XCTestCase {
    
    
    
    let triangleKind = (Equilateral:"Equilateral",Isosceles:"Isosceles",Scalene:"Scalene",ErrorKind:"ErrorKind")
    
    
    func test_equilateral_triangles_have_equal_sides(){
    XCTAssertEqual(triangleKind.Equilateral,  Triangle(2, 2, 2).kind)}
    
    func test_larger_equilateral_triangles_also_have_equal_sides(){
    XCTAssertEqual(triangleKind.Equilateral,  Triangle(10, 10, 10).kind)}
    
    func test_isosceles_triangles_have_last_two_sides_equal(){
    XCTAssertEqual(triangleKind.Isosceles,  Triangle(3, 4, 4).kind)}
    
    func test_isosceles_triangles_have_first_and_last_sides_equal(){
    XCTAssertEqual(triangleKind.Isosceles,  Triangle(4, 3, 4).kind)}
    
    func test_isosceles_triangles_have_two_first_sides_equal(){
    XCTAssertEqual(triangleKind.Isosceles,  Triangle(4, 4, 3).kind)}
    
    func test_isosceles_triangles_have_in_fact_exactly_two_sides_equal(){
    XCTAssertEqual(triangleKind.Isosceles,  Triangle(10, 10, 2).kind)}
    
    func test_scalene_triangles_have_no_equal_sides(){
    XCTAssertEqual(triangleKind.Scalene,  Triangle(3, 4, 5).kind)}
    
    func test_scalene_triangles_have_no_equal_sides_at_a_larger_scale_too(){
    XCTAssertEqual(triangleKind.Scalene,  Triangle(10, 11, 12).kind)}
    
    func test_scalene_triangles_have_no_equal_sides_in_descending_order_either(){
    XCTAssertEqual(triangleKind.Scalene,  Triangle(5, 4, 2).kind)}
    
    func test_very_small_triangles_are_legal(){
    XCTAssertEqual(triangleKind.Scalene,  Triangle(0.4, 0.6, 0.3).kind)}
    
    func test_triangles_with_no_size_are_illegal(){
        XCTAssertEqual(triangleKind.ErrorKind,  Triangle(0, 0, 0).kind)}
    
    func test_triangles_with_negative_sides_are_illegal(){
    XCTAssertEqual(triangleKind.ErrorKind,  Triangle(3, 4, -5).kind)}
    
    func test_triangles_violating_triangle_inequality_are_illegal(){
    XCTAssertEqual(triangleKind.ErrorKind,  Triangle(1, 1, 3).kind)}
    
    func test_triangles_violating_triangle_inequality_are_illegal_2(){
    XCTAssertEqual(triangleKind.ErrorKind,  Triangle(2, 4, 2).kind)}
    
    func test_triangles_violating_triangle_inequality_are_illegal_3(){
    XCTAssertEqual(triangleKind.ErrorKind,  Triangle(7, 3, 2).kind)}

    
 }

