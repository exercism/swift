#if swift(>=3.0)
    import XCTest
#endif

class AcronymTest: XCTestCase {

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

}
