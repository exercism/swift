import Foundation

/*
    Backus–Naur form for Smart Game Format

    Collection = GameTree+
    GameTree   = "(" Sequence GameTree* ")"
    Sequence   = Node+
    Node       = ";" Property*
    Property   = PropIdent PropValue+
    PropIdent  = UcLetter+
    PropValue  = "[" CValueType "]"
    CValueType = (ValueType | Compose)
    ValueType  = (None | Number | Real | Double | Color | SimpleText | Text | Point | Move | Stone)
    ; Compose — это специальный тип для парных значений, например "dd:pp"
    Compose    = ValueType ":" ValueType
*/

enum SGFParsingError: Error {
    case missingTree
    case noNodes
    case noDelimiter
    case lowerCaseProperty
    case parsingError
}

struct SGFTree: Codable, Equatable {
    var properties: [String: [String]] = [:]
    var children: [SGFTree] = []
}

func parse(_ encoded: String) throws -> SGFTree {
    let cursor = StringCursor(encoded)
    return try parseGameTree(cursor)
}

// MARK: - Parsing

fileprivate func parseGameTree(_ cursor: StringCursor) throws -> SGFTree {
    try expect("(", in: cursor, error: .missingTree)
    var node = try parseSequence(cursor)

    cursor.skipWhitespace()
    while cursor.current == "(" {
        node.children.append(try parseGameTree(cursor))
    }

    try expect(")", in: cursor, error: .parsingError)
    return node
    
}

fileprivate func parseSequence(_ cursor: StringCursor) throws -> SGFTree {
    var node = try parseNode(cursor)
    cursor.skipWhitespace()
    if cursor.current == ";" {
        node.children = [try parseSequence(cursor)]
    }
    return node
}

fileprivate func parseNode(_ cursor: StringCursor) throws -> SGFTree {
    try expect(";", in: cursor, error: .noNodes)
    cursor.skipWhitespace()

    var properties = [String: [String]]()
    while let current = cursor.current, current.isLetter {
        let (key, values) = try parseProperty(cursor)
        properties[key] = values
        cursor.skipWhitespace()
    }
    return SGFTree(properties: properties, children: []) 
}

fileprivate func parseProperty(_ cursor: StringCursor) throws -> (key: String, values: [String]) {
    cursor.skipWhitespace()
    let key = try readKey(cursor)
    guard !key.isEmpty else { throw SGFParsingError.parsingError }
    guard cursor.current == "[" else { throw SGFParsingError.noDelimiter } 

    var values = [String]()
    while cursor.current == "[" {
        values.append(try parseValue(cursor))
    }

    return (key, values)
}

fileprivate func parseValue(_ cursor: StringCursor) throws -> String {
    try expect("[", in: cursor, error: .noDelimiter)
    var buffer = ""

    while let current = cursor.current {
        switch current {
        case "]":
            cursor.advance()
            return buffer

        case "\t":
            buffer.append(" ")

        case "\\":
            cursor.advance()
            guard let next = cursor.current else {
                throw SGFParsingError.parsingError
            }
            switch (next) {
                case "\n":
                    break

                case "\t":
                    buffer.append(" ")

                default: 
                    buffer.append(next)
            }


        default:
            buffer.append(current)
        }
        cursor.advance()
    }
    throw SGFParsingError.parsingError   
}

fileprivate func readKey(_ cursor: StringCursor) throws -> String {
    var key = ""
    while let current = cursor.current, current != "[" {
        guard current.isLetter else {
            return key
        }
        guard current.isUppercase else {
            throw SGFParsingError.lowerCaseProperty
        }
        key.append(current)
        cursor.advance()
    }
    return key
}

fileprivate func expect(
    _ char: Character,
    in cursor: StringCursor,
    error: SGFParsingError
) throws {
    cursor.skipWhitespace()
    guard let current = cursor.current, current == char else {
        throw error
    }
    cursor.advance()
}

