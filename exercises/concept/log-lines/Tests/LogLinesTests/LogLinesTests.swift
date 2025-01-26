import Foundation
import Testing

@testable import LogLines

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct LogLinesTests {
  @Test("init trace")
  func testInitTrace() {
    let line = "[TRC]: Line 84 - Console.WriteLine('Hello World');"
    #expect(LogLevel(line) == LogLevel.trace)
  }

  @Test("init debug", .enabled(if: RUNALL))
  func testInitDebug() {
    let line = "[DBG]: ; expected"
    #expect(LogLevel(line) == LogLevel.debug)
  }

  @Test("init info", .enabled(if: RUNALL))
  func testInitInfo() {
    let line = "[INF]: Timezone changed"
    #expect(LogLevel(line) == LogLevel.info)
  }

  @Test("init warning", .enabled(if: RUNALL))
  func testInitWarning() {
    let line = "[WRN]: Timezone not set"
    #expect(LogLevel(line) == LogLevel.warning)
  }

  @Test("init error", .enabled(if: RUNALL))
  func testInitError() {
    let line = "[ERR]: Disk full"
    #expect(LogLevel(line) == LogLevel.error)
  }

  @Test("init fatal", .enabled(if: RUNALL))
  func testInitFatal() {
    let line = "[FTL]: Not enough memory"
    #expect(LogLevel(line) == LogLevel.fatal)
  }

  @Test("init unknown empty", .enabled(if: RUNALL))
  func testInitUnknownEmpty() {
    let line = "Something terrible has happened!"
    #expect(LogLevel(line) == LogLevel.unknown)
  }

  @Test("init unknown non-standard", .enabled(if: RUNALL))
  func testInitUnknownNonStandard() {
    let line = "[XYZ]: Gibberish message.. beep boop.."
    #expect(LogLevel(line) == LogLevel.unknown)
  }

  @Test("short trace", .enabled(if: RUNALL))
  func testShortTrace() {
    let message = "Line 13 - int myNum = 42;"
    #expect(LogLevel.trace.shortFormat(message: message) == "0:Line 13 - int myNum = 42;")
  }

  @Test("short debug", .enabled(if: RUNALL))
  func testShortDebug() {
    let message = "The name 'LogLevel' does not exist in the current context"
    #expect(
      LogLevel.debug.shortFormat(message: message)
        == "1:The name 'LogLevel' does not exist in the current context")
  }

  @Test("short info", .enabled(if: RUNALL))
  func testShortInfo() {
    let message = "File moved"
    #expect(LogLevel.info.shortFormat(message: message) == "4:File moved")
  }

  @Test("short warning", .enabled(if: RUNALL))
  func testShortWarning() {
    let message = "Unsafe password"
    #expect(LogLevel.warning.shortFormat(message: message) == "5:Unsafe password")
  }

  @Test("short error", .enabled(if: RUNALL))
  func testShortError() {
    let message = "Stack overflow"
    #expect(LogLevel.error.shortFormat(message: message) == "6:Stack overflow")
  }

  @Test("short fatal", .enabled(if: RUNALL))
  func testShortFatal() {
    let message = "Dumping all files"
    #expect(LogLevel.fatal.shortFormat(message: message) == "7:Dumping all files")
  }

  @Test("short unknown empty", .enabled(if: RUNALL))
  func testShortUnknownEmpty() {
    let message = "Wha happon?"
    #expect(LogLevel.unknown.shortFormat(message: message) == "42:Wha happon?")
  }
}
