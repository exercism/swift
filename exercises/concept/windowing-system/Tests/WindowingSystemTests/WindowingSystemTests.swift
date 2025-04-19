import Foundation
import Testing

@testable import WindowingSystem

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct WindowingSystemTests {
  @Test("New Window")
  func testNewWindow() {
    #expect(
      Window().display()
        == "New Window\nPosition: (0, 0), Size: (80 x 60)\n[This window intentionally left blank]\n"
    )
  }

  @Test("Position Move", .enabled(if: RUNALL))
  func testPositionMove() {
    var pos = Position()
    let newX = Int.random(in: 0...100)
    let newY = Int.random(in: 0...1000)
    pos.moveTo(newX: newX, newY: newY)
    #expect(
      pos.x == newX && pos.y == newY,
      "Expected: Position(x: \(newX), \(newY)), got Position(x: \(pos.x), \(pos.y))")
  }

  @Test("Size Resize", .enabled(if: RUNALL))
  func testSizeResize() {
    var size = Size()
    let newWidth = Int.random(in: 0...100)
    let newHeight = Int.random(in: 0...1000)
    size.resize(newWidth: newWidth, newHeight: newHeight)
    #expect(
      size.width == newWidth && size.height == newHeight,
      "Expected: Size(width: \(newWidth), height: \(newHeight)), got Size(width: \(size.width), height: \(size.height))"
    )
  }

  @Test("Move Valid", .enabled(if: RUNALL))
  func testMoveValid() {
    let testWindow = Window()
    testWindow.title = "Test Window"
    testWindow.contents = "test"
    testWindow.resize(to: Size(width: 100, height: 100))
    testWindow.move(to: Position(x: 100, y: 100))
    #expect(testWindow.display() == "Test Window\nPosition: (100, 100), Size: (100 x 100)\ntest\n")
  }

  @Test("Move Too Far", .enabled(if: RUNALL))
  func testMoveTooFar() {
    let testWindow = Window()
    testWindow.title = "Test Window"
    testWindow.contents = "test"
    testWindow.resize(to: Size(width: 100, height: 100))
    testWindow.move(to: Position(x: 750, y: 650))
    #expect(testWindow.display() == "Test Window\nPosition: (700, 500), Size: (100 x 100)\ntest\n")
  }

  @Test("Move Negative", .enabled(if: RUNALL))
  func testMoveNegative() {
    let testWindow = Window()
    testWindow.title = "Test Window"
    testWindow.contents = "test"
    testWindow.resize(to: Size(width: 100, height: 100))
    testWindow.move(to: Position(x: -80, y: -60))
    #expect(testWindow.display() == "Test Window\nPosition: (0, 0), Size: (100 x 100)\ntest\n")
  }

  @Test("Resize Valid", .enabled(if: RUNALL))
  func testResizeValid() {
    let testWindow = Window()
    testWindow.title = "Test Window"
    testWindow.contents = "test"
    testWindow.move(to: Position(x: 600, y: 500))
    testWindow.resize(to: Size(width: 100, height: 100))
    #expect(testWindow.display() == "Test Window\nPosition: (600, 500), Size: (100 x 100)\ntest\n")
  }

  @Test("Resize Too Far", .enabled(if: RUNALL))
  func testResizeTooFar() {
    let testWindow = Window()
    testWindow.title = "Test Window"
    testWindow.contents = "test"
    testWindow.move(to: Position(x: 710, y: 525))
    testWindow.resize(to: Size(width: 1000, height: 1000))
    #expect(testWindow.display() == "Test Window\nPosition: (710, 525), Size: (90 x 75)\ntest\n")
  }

  @Test("Resize Negative", .enabled(if: RUNALL))
  func testResizeNegative() {
    let testWindow = Window()
    testWindow.title = "Test Window"
    testWindow.contents = "test"
    testWindow.resize(to: Size(width: 0, height: -100))
    #expect(testWindow.display() == "Test Window\nPosition: (0, 0), Size: (1 x 1)\ntest\n")
  }

  @Test("Update Title", .enabled(if: RUNALL))
  func testUpdateTitle() {
    let window = Window()
    window.update(title: "Did it change?")
    #expect(
      window.display()
        == "Did it change?\nPosition: (0, 0), Size: (80 x 60)\n[This window intentionally left blank]\n"
    )
  }

  @Test("Update Text", .enabled(if: RUNALL))
  func testUpdateText() {
    let window = Window()
    window.update(text: "Did it change?")
    #expect(window.display() == "New Window\nPosition: (0, 0), Size: (80 x 60)\nDid it change?\n")
  }

  @Test("Update Text Nil", .enabled(if: RUNALL))
  func testUpdateTextNil() {
    let window = Window()
    window.update(text: "Did it change?")
    window.update(text: nil)
    #expect(
      window.display()
        == "New Window\nPosition: (0, 0), Size: (80 x 60)\n[This window intentionally left blank]\n"
    )
  }

  @Test("Initialzer accepts all input", .enabled(if: RUNALL))
  func testMainWindow() {
    let window = Window(title: "Main Window", contents: "This is the main window", size: Size(width: 400, height: 300), position: Position(x: 100, y: 100))
    #expect(
      window.display()
        == "Main Window\nPosition: (100, 100), Size: (400 x 300)\nThis is the main window\n")
  }

  @Test("Initialzer accepts all input except contents", .enabled(if: RUNALL))
  func testMainWindowNoContents() {
    let window = Window(title: "Main Window", contents: nil, size: Size(width: 400, height: 300), position: Position(x: 100, y: 100))
    #expect(
      window.display()
        == "Main Window\nPosition: (100, 100), Size: (400 x 300)\n[This window intentionally left blank]\n")
  }

  @Test("Initialzer accepts all input except size", .enabled(if: RUNALL))
  func testMainWindowNoSize() {
    let window = Window(title: "Main Window", contents: "This is the main window", size: Size(), position: Position(x: 100, y: 100))
    #expect(
      window.display()
        == "Main Window\nPosition: (100, 100), Size: (80 x 60)\nThis is the main window\n")
  }

  @Test("Initialzer accepts all input except position", .enabled(if: RUNALL))
  func testMainWindowNoPosition() {
    let window = Window(title: "Main Window", contents: "This is the main window", size: Size(width: 400, height: 300), position: Position())
    #expect(
      window.display()
        == "Main Window\nPosition: (0, 0), Size: (400 x 300)\nThis is the main window\n")
  }

  @Test("Initialzer accepts no position and no size", .enabled(if: RUNALL))
  func testMainWindowNoPositionNoSize() {
    let window = Window(title: "Main Window", contents: "This is the main window")
    #expect(
      window.display()
        == "Main Window\nPosition: (0, 0), Size: (80 x 60)\nThis is the main window\n")
  }
}
