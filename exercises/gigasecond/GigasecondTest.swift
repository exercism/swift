import XCTest




class GigasecondTest: XCTestCase {
    
    
    func test1 () {
        let gs = Gigasecond(from: "2011-04-25T00:00:00")?.description
            XCTAssertEqual("2043-01-01T01:46:40", gs)
    }
    
    func test2 () {
        let gs = Gigasecond(from: "1977-06-13T00:00:00")?.description
            XCTAssertEqual("2009-02-19T01:46:40", gs)
    }
    
    func test3 () {
        let gs = Gigasecond(from: "1959-07-19T00:00:00")?.description
            XCTAssertEqual("1991-03-27T01:46:40", gs)
    }
    
    func testTimeWithSeconds () {
        let gs = Gigasecond(from: "1959-07-19T23:59:59")?.description
        XCTAssertEqual("1991-03-28T01:46:39", gs)
    }
    
 }

