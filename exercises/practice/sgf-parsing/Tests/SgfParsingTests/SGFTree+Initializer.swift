import Foundation

@testable import SgfParsing

extension SGFTree {

    init?(jsonString: String) {
        guard let data = jsonString.data(using: .utf8) else { return nil }

        let decoder = JSONDecoder()
        guard let tree = try? decoder.decode(SGFTree.self, from: data) else { return nil }
        self = tree
    }

}