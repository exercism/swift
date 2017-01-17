import XCTest
@testable import SimpleLinkedList

class SimpleLinkedListTests: XCTestCase {
    func testConstructorA() {
        let one = Element(1, nil)
        let two = Element(2, one)
        XCTAssertEqual(1, one.value!)
        XCTAssertNil(one.next)
        XCTAssertEqual(2, two.value!)
    }

    func testConstructorB() {
        let one = Element(1, nil)
        let two = Element(2, one)
        let result = one.value
        let result2 = two.next?.value
        XCTAssertEqual(result!, result2!)
    }

    func testToA() {
        let elementNil = Element<Int>()
        let elementOne = Element(1, nil)
        let elementTwo = Element(2, elementOne)
        let elementThree = Element(3, elementTwo)
        XCTAssertEqual([], elementNil.toArray() )
        XCTAssertEqual([1], elementOne.toArray() )
        XCTAssertEqual([2, 1], elementTwo.toArray() )
        XCTAssertEqual([3, 2, 1], elementThree.toArray())
    }

    func testReverseOne() {
        let one = Element(1, nil)
        let oneR = one.reverseElements()
        XCTAssertEqual(1, oneR.value!)
        XCTAssertNil(oneR.next?.value)

    }

    func testReverseTwo() {
        let one = Element(1, nil)
        let two = Element(2, one)
        let twoR = two.reverseElements()
        XCTAssertEqual(1, twoR.value!)
        let expect = twoR.next?.value
        XCTAssertEqual(2, expect!)
    }

    func testFromAOne() {

        XCTAssertNil(Element<Int>.fromArray([]).value)
        let oneA = Element.fromArray([1])
        XCTAssertEqual(1, oneA.value!)
        XCTAssertNil(oneA.next?.value)

    }

    func testFromATwo() {

        let twoA = Element.fromArray([2, 1])
        XCTAssertEqual(2, twoA.value!)
        let expected = twoA.next?.value
        XCTAssertEqual(1, expected! )
        XCTAssertNil(twoA.next?.next?.value)
    }

    func testFromATen() {

        let oneToTen = Element.fromArray(Array(1...10))
        let expected10 = oneToTen.next?.next?.next?.next?.next?.next?.next?.next?.next?.value
        XCTAssertEqual(10, expected10! )
    }

    func testRoundtrip() {
        XCTAssertEqual([1], Element.fromArray([1]).toArray() )
        XCTAssertEqual([2, 1], Element.fromArray([2, 1]).toArray() )
        XCTAssertEqual(Array(1...10), Element.fromArray(Array(1...10)).toArray())
    }

    static var allTests: [(String, (SimpleLinkedListTests) -> () throws -> Void)] {
        return [
            ("testConstructorA", testConstructorA),
            ("testConstructorB", testConstructorB),
            ("testToA", testToA),
            ("testReverseOne", testReverseOne),
            ("testReverseTwo", testReverseTwo),
            ("testFromAOne", testFromAOne),
            ("testFromATwo", testFromATwo),
            ("testFromATen", testFromATen),
            ("testRoundtrip", testRoundtrip),
        ]
    }
}
