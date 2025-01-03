import Foundation
import Testing

@testable import CircularBuffer

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct CircularBufferTests {

  @Test("reading empty buffer should fail")
  func testReadingEmptyBufferShouldFail() {
    var buffer = CircularBuffer(capacity: 1)

    #expect(throws: CircularBufferError.bufferEmpty) { try buffer.read() }
  }

  @Test("can read an item just written", .enabled(if: RUNALL))
  func testCanReadAnItemJustWritten() {
    var buffer = CircularBuffer(capacity: 1)

    try! buffer.write(1)
    #expect(try! buffer.read() == 1)
  }

  @Test("each item may only be read once", .enabled(if: RUNALL))
  func testEachItemMayOnlyBeReadOnce() {
    var buffer = CircularBuffer(capacity: 1)

    try! buffer.write(1)
    #expect(try! buffer.read() == 1)
    #expect(throws: CircularBufferError.bufferEmpty) { try buffer.read() }
  }

  @Test("items are read in the order they are written", .enabled(if: RUNALL))
  func testItemsAreReadInTheOrderTheyAreWritten() {
    var buffer = CircularBuffer(capacity: 2)

    try! buffer.write(1)
    try! buffer.write(2)
    #expect(try! buffer.read() == 1)
    #expect(try! buffer.read() == 2)
  }

  @Test("full buffer can't be written to", .enabled(if: RUNALL))
  func testFullBufferCantBeWrittenTo() {
    var buffer = CircularBuffer(capacity: 1)

    try! buffer.write(1)
    #expect(throws: CircularBufferError.bufferFull) { try buffer.write(2) }
  }

  @Test("a read frees up capacity for another write", .enabled(if: RUNALL))
  func testAReadFreesUpCapacityForAnotherWrite() {
    var buffer = CircularBuffer(capacity: 1)

    try! buffer.write(1)
    #expect(try! buffer.read() == 1)
    try! buffer.write(2)
    #expect(try! buffer.read() == 2)
  }

  @Test("read position is maintained even across multiple writes", .enabled(if: RUNALL))
  func testReadPositionIsMaintainedEvenAcrossMultipleWrites() {
    var buffer = CircularBuffer(capacity: 3)

    try! buffer.write(1)
    try! buffer.write(2)
    #expect(try! buffer.read() == 1)
    try! buffer.write(3)
    #expect(try! buffer.read() == 2)
    #expect(try! buffer.read() == 3)
  }

  @Test("items cleared out of buffer can't be read", .enabled(if: RUNALL))
  func testItemsClearedOutOfBufferCantBeRead() {
    var buffer = CircularBuffer(capacity: 1)

    try! buffer.write(1)
    buffer.clear()
    #expect(throws: CircularBufferError.bufferEmpty) { try buffer.read() }
  }

  @Test("clear frees up capacity for another write", .enabled(if: RUNALL))
  func testClearFreesUpCapacityForAnotherWrite() {
    var buffer = CircularBuffer(capacity: 1)

    try! buffer.write(1)
    buffer.clear()
    try! buffer.write(2)
    #expect(try! buffer.read() == 2)
  }

  @Test("clear does nothing on empty buffer", .enabled(if: RUNALL))
  func testClearDoesNothingOnEmptyBuffer() {
    var buffer = CircularBuffer(capacity: 1)

    buffer.clear()
    try! buffer.write(1)
    #expect(try! buffer.read() == 1)
  }

  @Test("overwrite acts like write on non-full buffer", .enabled(if: RUNALL))
  func testOverwriteActsLikeWriteOnNonFullBuffer() {
    var buffer = CircularBuffer(capacity: 2)

    try! buffer.write(1)
    buffer.overwrite(2)
    #expect(try! buffer.read() == 1)
    #expect(try! buffer.read() == 2)
  }

  @Test("overwrite replaces the oldest item on full buffer", .enabled(if: RUNALL))
  func testOverwriteReplacesTheOldestItemOnFullBuffer() {
    var buffer = CircularBuffer(capacity: 2)

    try! buffer.write(1)
    try! buffer.write(2)
    buffer.overwrite(3)
    #expect(try! buffer.read() == 2)
    #expect(try! buffer.read() == 3)
  }

  @Test(
    "overwrite replaces the oldest item remaining in buffer following a read", .enabled(if: RUNALL))
  func testOverwriteReplacesTheOldestItemRemainingInBufferFollowingARead() {
    var buffer = CircularBuffer(capacity: 3)

    try! buffer.write(1)
    try! buffer.write(2)
    try! buffer.write(3)
    #expect(try! buffer.read() == 1)
    try! buffer.write(4)
    buffer.overwrite(5)
    #expect(try! buffer.read() == 3)
    #expect(try! buffer.read() == 4)
    #expect(try! buffer.read() == 5)
  }

  @Test("initial clear does not affect wrapping around", .enabled(if: RUNALL))
  func testInitialClearDoesNotAffectWrappingAround() {
    var buffer = CircularBuffer(capacity: 2)

    buffer.clear()
    try! buffer.write(1)
    try! buffer.write(2)
    buffer.overwrite(3)
    buffer.overwrite(4)
    #expect(try! buffer.read() == 3)
    #expect(try! buffer.read() == 4)
    #expect(throws: CircularBufferError.bufferEmpty) { try buffer.read() }
  }
}
