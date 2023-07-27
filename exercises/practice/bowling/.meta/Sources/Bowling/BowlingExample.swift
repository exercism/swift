enum BowlingError: Error {
  case negativePins
  case tooManyPinsInFrame
  case gameIsOver
  case gameInProgress
}

class Bowling {
  var scoreCard: [Int]

  init(_ rolls: [Int]) {
    scoreCard = rolls
  }

  func roll(pins: Int) throws {
    if pins < 0 {
      throw BowlingError.negativePins
    }
    if pins > 10 || scoreCard.count % 2 == 1 && pins + scoreCard.last! > 10
      || scoreCard.count % 2 == 0 && pins > 10 - scoreCard.last!
    {
      throw BowlingError.tooManyPinsInFrame
    }
    if scoreCard.count >= 20 {
      throw BowlingError.gameIsOver
    }
    scoreCard.append(pins)
  }

  func score() throws -> Int {
    if scoreCard.count < 12 {
      throw BowlingError.gameInProgress
    }
    var score = 0
    var frame = 0

    for _ in 0..<10 {
      if scoreCard[frame] == 10 {
        if scoreCard.count > frame + 2 {
          score += 10 + scoreCard[frame + 1] + scoreCard[frame + 2]
        } else {
          throw BowlingError.gameInProgress
        }
        frame += 1
      } else if scoreCard[frame] + scoreCard[frame + 1] == 10 {
        if scoreCard.count > frame + 2 {
          score += 10 + scoreCard[frame + 2]
        } else {
          throw BowlingError.gameInProgress
        }
        frame += 2
      } else if scoreCard[frame] + scoreCard[frame + 1] > 10 {
        throw BowlingError.tooManyPinsInFrame
      } else {
        score += scoreCard[frame] + scoreCard[frame + 1]
        frame += 2
      }
    }
    return score
  }
}
