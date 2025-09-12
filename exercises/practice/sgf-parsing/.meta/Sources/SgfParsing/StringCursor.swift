import Foundation

final class StringCursor {

    var current: Character? { isEnd ? nil : text[index] }

    private let text: String
    private var index: String.Index
    private var isEnd: Bool { index >= text.endIndex }
    
    init(_ text: String) {
        self.text = text
        self.index = text.startIndex
    }
    
    func advance() {
        guard !isEnd else { return }
        index = text.index(after: index)
    }

    func skipWhitespace() {
        while current?.isWhitespace ?? false { advance() }
    }
    
}
