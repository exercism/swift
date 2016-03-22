import XCTest



class OcrNumbersTest: XCTestCase {
    
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
        var throwsInvalidNumberOfLinesError = false
        
        defer {
            XCTAssertTrue(throwsInvalidNumberOfLinesError)
        }
        
        do {
            let text =
                "    _  _ \n" +
                "  | _| _|"
            let _ = try OCR(text)
        } catch OCR.Error.InvalidNumberOfLines {
            throwsInvalidNumberOfLinesError = true
            return
        } catch {
            return
        }
    }
    
    func testThrowsInvalidNumberOfColumnsError() {
        var throwsInvalidNumberOfColumnsError = false
        
        defer {
            XCTAssertTrue(throwsInvalidNumberOfColumnsError)
        }
        
        do {
            let text =
                "    _\n" +
                "  | _\n" +
                "  ||_\n" +
                "     "
            let _ = try OCR(text)
        } catch OCR.Error.InvalidNumberOfColumns {
            throwsInvalidNumberOfColumnsError = true
            return
        } catch {
            return
        }
    }
    
}
