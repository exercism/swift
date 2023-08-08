import Foundation

class BottleSong {
  var bottles: Int
  let numberText: [Int: String] = [
    0: "no",
    1: "one",
    2: "two",
    3: "three",
    4: "four",
    5: "five",
    6: "six",
    7: "seven",
    8: "eight",
    9: "nine",
    10: "ten",
  ]

  init(bottles: Int) {
    self.bottles = bottles
  }

  func song(takedown: Int) -> [String] {
    var song = [String]()
    for current in 0..<takedown {
      song.append(contentsOf: verse(bottles: bottles))
      bottles -= 1
      if current != takedown - 1 {
        song.append("")
      }
    }
    return song
  }

  private func verse(bottles: Int) -> [String] {
    return [
      "\(numberText[bottles]!.capitalized) green \(bottles == 1 ? "bottle" : "bottles") hanging on the wall,",
      "\(numberText[bottles]!.capitalized) green \(bottles == 1 ? "bottle" : "bottles") hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be \(numberText[bottles - 1]!) green \((bottles - 1) == 1 ? "bottle" : "bottles") hanging on the wall.",
    ]
  }
}
