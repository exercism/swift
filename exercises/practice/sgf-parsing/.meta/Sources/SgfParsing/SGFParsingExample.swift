// Taken from https://exercism.org/tracks/swift/exercises/sgf-parsing/solutions/cosmichearse

func parse(_ encoded: String) throws -> SGFTree {
    var index = encoded.startIndex

    func peek() -> Character? {
        guard index < encoded.endIndex else { return nil }

        return encoded[index]
    }

    func advance() {
        index = encoded.index(after: index)
    }

    func parseValue() -> String {
        var result = ""

        while let ch = peek(), ch != "]" {
            advance()

            if ch == "\\" {
                guard let next = peek() else { break }
                advance()
                if next == "\n" {
                    // escaped newline → nothing
                } else if next == "\t" || next == " " {
                    result.append(" ")
                } else {
                    result.append(next)
                }
            } else if ch == "\t" {
                result.append(" ")
            } else {
                result.append(ch)
            }
        }

        advance() // skip ']'

        return result
    }

    func parseProperties() throws -> [String: [String]] {
        var properties: [String: [String]] = [:]

        while let ch = peek(), ch.isLetter {
            guard ch.isUppercase else {
                throw SGFParsingError.lowerCaseProperty
            }

            var key = ""
            while let k = peek(), k.isUppercase {
                key.append(k)
                advance()
            }

            if let k = peek(), k.isLowercase {
                throw SGFParsingError.lowerCaseProperty
            }

            guard peek() == "[" else {
                throw SGFParsingError.noDelimiter
            }

            var values: [String] = []
            while peek() == "[" {
                advance() // skip '['
                values.append(parseValue())
            }
            properties[key, default: []].append(contentsOf: values)
        }

        return properties
    }

    func parseNode() throws -> SGFTree {
        advance() // skip ';'
        let properties = try parseProperties()
        var children: [SGFTree] = []

        if peek() == ";" {
            children.append(try parseNode())
        } else {
            while peek() == "(" {
                children.append(try parseTree())
            }
        }

        return SGFTree(properties: properties, children: children)
    }

    func parseTree() throws -> SGFTree {
        guard peek() == "(" else {
            throw SGFParsingError.missingTree
        }
        advance() // skip '('

        guard peek() == ";" else {
            throw SGFParsingError.noNodes
        }

        let tree = try parseNode()

        advance() // skip ')'

        return tree
    }

    return try parseTree()
}
