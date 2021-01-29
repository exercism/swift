import XCTest
@testable import OcrNumbers

class OcrNumbersTests: XCTestCase {
    func testRecognizeZero() {
        let text =  " _ \n" +
            "| |\n" +
            "|_|\n" +
        "   "
        XCTAssertEqual("0", try? OCR(text).converted())
    }

    func testRecognizeOne() {
        let text =  "   \n" +
            "  |\n" +
            "  |\n" +
        "   "
        XCTAssertEqual("1", try? OCR(text).converted())
    }

    func testRecognizeTwo() {
        let text =  " _ \n" +
            " _|\n" +
            "|_ \n" +
        "   "
        XCTAssertEqual("2", try? OCR(text).converted())
    }

    func testRecognizeThree() {
        let text =  " _ \n" +
            " _|\n" +
            " _|\n" +
        "   "
        XCTAssertEqual("3", try? OCR(text).converted())
    }

    func testRecognizeFour() {
        let text =  "   \n" +
            "|_|\n" +
            "  |\n" +
        "   "
        XCTAssertEqual("4", try? OCR(text).converted())
    }

    func testRecognizeFive() {
        let text =  " _ \n" +
            "|_ \n" +
            " _|\n" +
        "   "
        XCTAssertEqual("5", try? OCR(text).converted())
    }

    func testRecognizeSix() {
        let text =  " _ \n" +
            "|_ \n" +
            "|_|\n" +
        "   "
        XCTAssertEqual("6", try? OCR(text).converted())
    }

    func testRecognizeSeven() {
        let text =  " _ \n" +
            "  |\n" +
            "  |\n" +
        "   "
        XCTAssertEqual("7", try? OCR(text).converted())
    }

    func testRecognizeEight() {
        let text =  " _ \n" +
            "|_|\n" +
            "|_|\n" +
        "   "
        XCTAssertEqual("8", try? OCR(text).converted())
    }

    func testRecognizeNine() {
        let text =  " _ \n" +
            "|_|\n" +
            " _|\n" +
        "   "
        XCTAssertEqual("9", try? OCR(text).converted())
    }

    func testIdentifyGarble() {
        let text =  "   \n" +
            "| |\n" +
            "| |\n" +
        "   "
        XCTAssertEqual("?", try? OCR(text).converted())
    }

    func testIdentify10() {
        let text =  "    _ \n" +
            "  || |\n" +
            "  ||_|\n" +
        "      "
        XCTAssertEqual("10", try? OCR(text).converted())
    }

    func testIdentify110101100() {
        let text =
            "       _     _        _  _ \n" +
                "  |  || |  || |  |  || || |\n" +
                "  |  ||_|  ||_|  |  ||_||_|\n" +
        "                           "
        XCTAssertEqual("110101100", try? OCR(text).converted())
    }

    func testIdentifyWithGarble() {
        let text =
            "       _     _           _ \n" +
                "  |  || |  || |     || || |\n" +
                "  |  | _|  ||_|  |  ||_||_|\n" +
        "                           "
        XCTAssertEqual("11?10?1?0", try? OCR(text).converted())
    }

    func testIdentify1234567890() {
        let text =
            "    _  _     _  _  _  _  _  _ \n" +
                "  | _| _||_||_ |_   ||_||_|| |\n" +
                "  ||_  _|  | _||_|  ||_| _||_|\n" +
        "                              "
        XCTAssertEqual("1234567890", try? OCR(text).converted())
    }

    func testIdentify123_456_789() {
        let text =
            "    _  _ \n" +
                "  | _| _|\n" +
                "  ||_  _|\n" +
                "         \n" +
                "    _  _ \n" +
                "|_||_ |_ \n" +
                "  | _||_|\n" +
                "         \n" +
                " _  _  _ \n" +
                "  ||_||_|\n" +
                "  ||_| _|\n" +
        "         "
        XCTAssertEqual("123,456,789", try? OCR(text).converted())
    }

    func testThrowsInvalidNumberOfLinesError() {
        let text =
            "    _  _ \n" +
        "  | _| _|"

        XCTAssertThrowsError(_ = try OCR(text)) { error in
            XCTAssertEqual(error as? OCR.OCRError, .invalidNumberOfLines)
        }
    }

    func testThrowsInvalidNumberOfColumnsError() {
        let text =
            "    _\n" +
                "  | _\n" +
                "  ||_\n" +
        "     "

        XCTAssertThrowsError(_ = try OCR(text)) { error in
            XCTAssertEqual(error as? OCR.OCRError, .invalidNumberOfColumns)
        }
    }

    static var allTests: [(String, (OcrNumbersTests) -> () throws -> Void)] {
        return [
            ("testRecognizeZero", testRecognizeZero),
            ("testRecognizeOne", testRecognizeOne),
            ("testRecognizeTwo", testRecognizeTwo),
            ("testRecognizeThree", testRecognizeThree),
            ("testRecognizeFour", testRecognizeFour),
            ("testRecognizeFive", testRecognizeFive),
            ("testRecognizeSix", testRecognizeSix),
            ("testRecognizeSeven", testRecognizeSeven),
            ("testRecognizeEight", testRecognizeEight),
            ("testRecognizeNine", testRecognizeNine),
            ("testIdentifyGarble", testIdentifyGarble),
            ("testIdentify10", testIdentify10),
            ("testIdentify110101100", testIdentify110101100),
            ("testIdentifyWithGarble", testIdentifyWithGarble),
            ("testIdentify1234567890", testIdentify1234567890),
            ("testIdentify123_456_789", testIdentify123_456_789),
            ("testThrowsInvalidNumberOfLinesError", testThrowsInvalidNumberOfLinesError),
            ("testThrowsInvalidNumberOfColumnsError", testThrowsInvalidNumberOfColumnsError),
        ]
    }
}
