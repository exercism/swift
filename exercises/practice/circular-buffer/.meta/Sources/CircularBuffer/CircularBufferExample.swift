import Foundation

enum CircularBufferError: Error {
    case bufferFull
    case bufferEmpty
}

struct CircularBuffer<T: Equatable> {
    var buffer: [T?]
    let capacity: Int
    var writePoint = 0
    var readPoint = 0

    private var isFull: Bool {
        return buffer.compactMap { $0 }.count >= capacity
    }

    private var isEmpty: Bool {
        return buffer.compactMap { $0 }.isEmpty
    }

    init(capacity: Int) {
        self.capacity = capacity
        buffer = [T?](repeating: nil, count: capacity)
    }

    mutating func write(_ data: T) throws {
        guard !isFull else {
            throw CircularBufferError.bufferFull
        }

        buffer[writePoint] = data
        updateWritePoint()
    }

    mutating func overwrite(_ data: T) {
        buffer[writePoint] = data
        if isFull && writePoint == readPoint {
            updateReadPoint()
        }
        updateWritePoint()
    }

    mutating func read() throws -> T {
        guard let data = buffer[readPoint] else {
            throw CircularBufferError.bufferEmpty
        }

        buffer[readPoint] = nil
        updateReadPoint()

        return data
    }

    mutating func clear() {
        buffer = [T?](repeating: nil, count: capacity)
    }

    private mutating func updateWritePoint() {
        writePoint = (writePoint + 1) % capacity
    }

    private mutating func updateReadPoint() {
        readPoint = (readPoint + 1) % capacity
    }
}
