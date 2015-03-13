import Foundation
import XCTest

// Use Optionals and Generic Classes

class SimpleLinkedListTest: XCTestCase {
    
    func test_constructorA(){
        var one = Element(1, nil)
        var two = Element(2, one)
        XCTAssertEqual(1, one.value!)
        XCTAssertNil(one.next)
        XCTAssertEqual(2, two.value!)

    }
    
    
    func test_constructorB(){
        var one = Element(1, nil)
        var two = Element(2, one)
        let result = one.value
        let result2 = two.next?.value
        XCTAssertEqual(result!, result2!)
    }
    
    
    func test_to_a(){
        var elementNil = Element<Int>()
        var elementOne = Element(1, nil)
        var elementTwo = Element(2, elementOne)
        var elementThree = Element(3, elementTwo)
        XCTAssertEqual([] ,      elementNil.toArray() )
        XCTAssertEqual([1] ,      elementOne.toArray() )
        XCTAssertEqual([2, 1] ,     elementTwo.toArray() )
        XCTAssertEqual([3, 2, 1] ,  elementThree.toArray())
    }
    
    func test_reverse(){
        
        var one = Element(1, nil)
        var two = Element(2, one)
        let one_r = one.reverseElements()
        XCTAssertEqual(1, one_r.value!)
        XCTAssertNil(one_r.next?.value)
        let two_r = two.reverseElements()
        XCTAssertEqual(1, two_r.value!)
        let expect = two_r.next?.value
        XCTAssertEqual(2, expect!)
    }
    
    
    func test_from_a(){
        
        XCTAssertNil(Element<Int>.fromArray([]).value)
        let one_a = Element.fromArray([1])
        XCTAssertEqual(1, one_a.value!)
        XCTAssertNil(one_a.next?.value)
        let two_a = Element.fromArray([2, 1])
        XCTAssertEqual(2, two_a.value!)
        let expected = two_a.next?.value
        XCTAssertEqual(1, expected! )
        XCTAssertNil(two_a.next?.next?.value)
        let one_to_ten = Element.fromArray(Array(1...10))
        let expected10 = one_to_ten.next?.next?.next?.next?.next?.next?.next?.next?.next?.value
        XCTAssertEqual(10, expected10! )
    }
    
    
    func test_roundtrip(){
        XCTAssertEqual([1], Element.fromArray([1]).toArray() )
        XCTAssertEqual([2, 1], Element.fromArray([2, 1]).toArray() )
        XCTAssertEqual(Array(1...10), Element.fromArray(Array(1...10)).toArray())
    }
    
    
}