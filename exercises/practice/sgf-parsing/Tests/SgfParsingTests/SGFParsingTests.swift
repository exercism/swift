import Foundation
import Testing

@testable import SgfParsing

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct SgfParsingTests {

  @Test("empty input")
  func testEmptyInput() throws {
    #expect(throws: SGFParsingError.missingTree) { try parse("") }
  }

  @Test("tree with no nodes", .enabled(if: RUNALL))
  func testTreeWithNoNodes() throws {
    #expect(throws: SGFParsingError.noNodes) { try parse("()") }
  }

  @Test("node without tree", .enabled(if: RUNALL))
  func testNodeWithoutTree() throws {
    #expect(throws: SGFParsingError.missingTree) { try parse(";") }
  }

  @Test("node without properties", .enabled(if: RUNALL))
  func testNodeWithoutProperties() throws {
    let expectedTree = SGFTree(jsonString: "{\"children\":[],\"properties\":{}}")
    let actualTree = try parse("(;)")
    #expect(expectedTree == actualTree, "Expect trees to match")
  }

  @Test("single node tree", .enabled(if: RUNALL))
  func testSingleNodeTree() throws {
    let expectedTree = SGFTree(jsonString: "{\"children\":[],\"properties\":{\"A\":[\"B\"]}}")
    let actualTree = try parse("(;A[B])")
    #expect(expectedTree == actualTree, "Expect trees to match")
  }

  @Test("multiple properties", .enabled(if: RUNALL))
  func testMultipleProperties() throws {
    let expectedTree = SGFTree(
      jsonString: "{\"children\":[],\"properties\":{\"A\":[\"b\"],\"C\":[\"d\"]}}")
    let actualTree = try parse("(;A[b]C[d])")
    #expect(expectedTree == actualTree, "Expect trees to match")
  }

  @Test("properties without delimiter", .enabled(if: RUNALL))
  func testPropertiesWithoutDelimiter() throws {
    #expect(throws: SGFParsingError.noDelimiter) { try parse("(;A)") }
  }

  @Test("all lowercase property", .enabled(if: RUNALL))
  func testAllLowercaseProperty() throws {
    #expect(throws: SGFParsingError.lowerCaseProperty) { try parse("(;a[b])") }
  }

  @Test("upper and lowercase property", .enabled(if: RUNALL))
  func testUpperAndLowercaseProperty() throws {
    #expect(throws: SGFParsingError.lowerCaseProperty) { try parse("(;Aa[b])") }
  }

  @Test("two nodes", .enabled(if: RUNALL))
  func testTwoNodes() throws {
    let expectedTree = SGFTree(
      jsonString:
        "{\"children\":[{\"children\":[],\"properties\":{\"B\":[\"C\"]}}],\"properties\":{\"A\":[\"B\"]}}"
    )
    let actualTree = try parse("(;A[B];B[C])")
    #expect(expectedTree == actualTree, "Expect trees to match")
  }

  @Test("two child trees", .enabled(if: RUNALL))
  func testTwoChildTrees() throws {
    let expectedTree = SGFTree(
      jsonString:
        "{\"children\":[{\"children\":[],\"properties\":{\"B\":[\"C\"]}},{\"children\":[],\"properties\":{\"C\":[\"D\"]}}],\"properties\":{\"A\":[\"B\"]}}"
    )
    let actualTree = try parse("(;A[B](;B[C])(;C[D]))")
    #expect(expectedTree == actualTree, "Expect trees to match")
  }

  @Test("multiple property values", .enabled(if: RUNALL))
  func testMultiplePropertyValues() throws {
    let expectedTree = SGFTree(
      jsonString: "{\"children\":[],\"properties\":{\"A\":[\"b\",\"c\",\"d\"]}}")
    let actualTree = try parse("(;A[b][c][d])")
    #expect(expectedTree == actualTree, "Expect trees to match")
  }

  @Test(
    "within property values, whitespace characters such as tab are converted to spaces",
    .enabled(if: RUNALL))
  func testWithinPropertyValuesWhitespaceCharactersSuchAsTabAreConvertedToSpaces() throws {
    let expectedTree = SGFTree(
      jsonString: "{\"children\":[],\"properties\":{\"A\":[\"hello  world\"]}}")
    let actualTree = try parse("(;A[hello\t\tworld])")
    #expect(expectedTree == actualTree, "Expect trees to match")
  }

  @Test("within property values, newlines remain as newlines", .enabled(if: RUNALL))
  func testWithinPropertyValuesNewlinesRemainAsNewlines() throws {
    let expectedTree = SGFTree(
      jsonString: "{\"children\":[],\"properties\":{\"A\":[\"hello\\n\\nworld\"]}}")
    let actualTree = try parse("(;A[hello\n\nworld])")
    #expect(expectedTree == actualTree, "Expect trees to match")
  }

  @Test(
    "escaped closing bracket within property value becomes just a closing bracket",
    .enabled(if: RUNALL))
  func testEscapedClosingBracketWithinPropertyValueBecomesJustAClosingBracket() throws {
    let expectedTree = SGFTree(jsonString: "{\"children\":[],\"properties\":{\"A\":[\"]\"]}}")
    let actualTree = try parse("(;A[\\]])")
    #expect(expectedTree == actualTree, "Expect trees to match")
  }

  @Test("escaped backslash in property value becomes just a backslash", .enabled(if: RUNALL))
  func testEscapedBackslashInPropertyValueBecomesJustABackslash() throws {
    let expectedTree = SGFTree(jsonString: "{\"children\":[],\"properties\":{\"A\":[\"\\\\\"]}}")
    let actualTree = try parse("(;A[\\\\])")
    #expect(expectedTree == actualTree, "Expect trees to match")
  }

  @Test("opening bracket within property value doesn't need to be escaped", .enabled(if: RUNALL))
  func testOpeningBracketWithinPropertyValueDoesntNeedToBeEscaped() throws {
    let expectedTree = SGFTree(
      jsonString:
        "{\"children\":[{\"children\":[],\"properties\":{\"C\":[\"baz\"]}}],\"properties\":{\"A\":[\"x[y]z\",\"foo\"],\"B\":[\"bar\"]}}"
    )
    let actualTree = try parse("(;A[x[y\\]z][foo]B[bar];C[baz])")
    #expect(expectedTree == actualTree, "Expect trees to match")
  }

  @Test("semicolon in property value doesn't need to be escaped", .enabled(if: RUNALL))
  func testSemicolonInPropertyValueDoesntNeedToBeEscaped() throws {
    let expectedTree = SGFTree(
      jsonString:
        "{\"children\":[{\"children\":[],\"properties\":{\"C\":[\"baz\"]}}],\"properties\":{\"A\":[\"a;b\",\"foo\"],\"B\":[\"bar\"]}}"
    )
    let actualTree = try parse("(;A[a;b][foo]B[bar];C[baz])")
    #expect(expectedTree == actualTree, "Expect trees to match")
  }

  @Test("parentheses in property value don't need to be escaped", .enabled(if: RUNALL))
  func testParenthesesInPropertyValueDontNeedToBeEscaped() throws {
    let expectedTree = SGFTree(
      jsonString:
        "{\"children\":[{\"children\":[],\"properties\":{\"C\":[\"baz\"]}}],\"properties\":{\"A\":[\"x(y)z\",\"foo\"],\"B\":[\"bar\"]}}"
    )
    let actualTree = try parse("(;A[x(y)z][foo]B[bar];C[baz])")
    #expect(expectedTree == actualTree, "Expect trees to match")
  }

  @Test("escaped tab in property value is converted to space", .enabled(if: RUNALL))
  func testEscapedTabInPropertyValueIsConvertedToSpace() throws {
    let expectedTree = SGFTree(
      jsonString: "{\"children\":[],\"properties\":{\"A\":[\"hello world\"]}}")
    let actualTree = try parse("(;A[hello\\\tworld])")
    #expect(expectedTree == actualTree, "Expect trees to match")
  }

  @Test("escaped newline in property value is converted to nothing at all", .enabled(if: RUNALL))
  func testEscapedNewlineInPropertyValueIsConvertedToNothingAtAll() throws {
    let expectedTree = SGFTree(
      jsonString: "{\"children\":[],\"properties\":{\"A\":[\"helloworld\"]}}")
    let actualTree = try parse("(;A[hello\\\nworld])")
    #expect(expectedTree == actualTree, "Expect trees to match")
  }

  @Test("escaped t and n in property value are just letters, not whitespace", .enabled(if: RUNALL))
  func testEscapedTAndNInPropertyValueAreJustLettersNotWhitespace() throws {
    let expectedTree = SGFTree(
      jsonString: "{\"children\":[],\"properties\":{\"A\":[\"t = t and n = n\"]}}")
    let actualTree = try parse("(;A[\\t = t and \\n = n])")
    #expect(expectedTree == actualTree, "Expect trees to match")
  }

  @Test(
    "mixing various kinds of whitespace and escaped characters in property value",
    .enabled(if: RUNALL))
  func testMixingVariousKindsOfWhitespaceAndEscapedCharactersInPropertyValue() throws {
    let expectedTree = SGFTree(
      jsonString: "{\"children\":[],\"properties\":{\"A\":[\"]b\\ncd  e\\\\ ]\"]}}")
    let actualTree = try parse("(;A[\\]b\nc\\\nd\t\te\\\\ \\\n\\]])")
    #expect(expectedTree == actualTree, "Expect trees to match")
  }
}
