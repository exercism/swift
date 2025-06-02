struct Size {
  var width = 80
  var height = 60

  mutating func resize(newWidth: Int, newHeight: Int) {
    width = newWidth
    height = newHeight
  }
}

struct Position {
  var x = 0
  var y = 0

  mutating func moveTo(newX: Int, newY: Int) {
    x = newX
    y = newY
  }
}

class Window {
  var title = "New Window"
  let screenSize = Size(width: 800, height: 600)
  var size = Size()
  var position = Position()
  var contents: String?

  init() {}

  init(title: String, contents: String?, size : Size = Size(), position: Position = Position()) {
    self.title = title
    self.contents = contents
    self.size = size
    self.position = position
  }

  func move(to newPosition: Position) {
    let minX = min(max(0, newPosition.x), screenSize.width - size.width)
    let minY = min(max(0, newPosition.y), screenSize.height - size.height)
    position.moveTo(newX: minX, newY: minY)
  }
  func resize(to newSize: Size) {
    let minW = min(max(1, newSize.width), screenSize.width - position.x)
    let minH = min(max(1, newSize.height), screenSize.height - position.y)
    size.resize(newWidth: minW, newHeight: minH)
  }
  func update(title: String) {
    self.title = title
  }
  func update(text: String?) {
    contents = text
  }
  func display() -> String {
    "\(title)\nPosition: (\(position.x), \(position.y)), Size: (\(size.width) x \(size.height))\n\(contents ?? "[This window intentionally left blank]")\n"
  }
}
