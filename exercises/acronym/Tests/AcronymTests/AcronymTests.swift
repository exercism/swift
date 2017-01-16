import XCTest
@testable import Acronym

class AcronymTests: XCTestCase {
    func testAcronymAbbreviateTest1() {
        XCTAssertEqual("PNG", Acronym.abbreviate("Portable Network Graphics"))
    }

    func testAcronymAbbreviateTest2() {
        XCTAssertEqual("ROR", Acronym.abbreviate("Ruby on Rails"))
    }

    func testAcronymAbbreviateTest3() {
        XCTAssertEqual("HTML", Acronym.abbreviate("HyperText Markup Language"))
    }

    func testAcronymAbbreviateTest4() {
        XCTAssertEqual("FIFO", Acronym.abbreviate("First In, First Out"))
    }

    func testAcronymAbbreviateTest5() {
        XCTAssertEqual("PHP", Acronym.abbreviate("PHP: Hypertext Preprocessor"))
    }

    func testAcronymAbbreviateTest6() {
        XCTAssertEqual("CMOS", Acronym.abbreviate("Complementary metal-oxide semiconductor"))
    }

    static var allTests: [(String, (AcronymTests) -> () throws -> Void)] {
        return [
            ("testAcronymAbbreviateTest1", testAcronymAbbreviateTest1),
            ("testAcronymAbbreviateTest2", testAcronymAbbreviateTest2),
            ("testAcronymAbbreviateTest3", testAcronymAbbreviateTest3),
            ("testAcronymAbbreviateTest4", testAcronymAbbreviateTest4),
            ("testAcronymAbbreviateTest5", testAcronymAbbreviateTest5),
            ("testAcronymAbbreviateTest6", testAcronymAbbreviateTest6),
        ]
    }
}
