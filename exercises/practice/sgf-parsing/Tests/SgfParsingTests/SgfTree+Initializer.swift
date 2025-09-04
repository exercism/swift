import Foundation

@testable import SgfParsing

extension CGFTree {

    init?(jsonString: String) {
        guard let data = jsonString.data(using: .utf8) else { return nil }

        let decoder = JSONDecoder()
        guard let tree = try? decoder.decode(CGFTree.self, from: data) else { return nil }
        self = tree
    }

}