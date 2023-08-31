import Foundation

class Tournament {
  var matches: [(team: String, opponent: String, result: String)] = []

  func addMatch(_ match: String) {
    let matchComponents = match.components(separatedBy: ";")
    let team1 = matchComponents[0]
    let team2 = matchComponents[1]
    let result = matchComponents[2]
    matches.append((team: team1, opponent: team2, result: result))
  }

  func tally() -> [String] {
    var result = ["Team                           | MP |  W |  D |  L |  P"]
    var ranking = [String: (MP: Int, W: Int, D: Int, L: Int, P: Int)]()
    for match in matches {
      let team1 = match.team
      let team2 = match.opponent
      let result = match.result
      if ranking[team1] == nil {
        ranking[team1] = (0, 0, 0, 0, 0)
      }
      if ranking[team2] == nil {
        ranking[team2] = (0, 0, 0, 0, 0)
      }
      ranking[team1]!.MP += 1
      ranking[team2]!.MP += 1
      switch result {
      case "win":
        ranking[team1]!.W += 1
        ranking[team1]!.P += 3
        ranking[team2]!.L += 1
      case "loss":
        ranking[team1]!.L += 1
        ranking[team2]!.W += 1
        ranking[team2]!.P += 3
      case "draw":
        ranking[team1]!.D += 1
        ranking[team1]!.P += 1
        ranking[team2]!.D += 1
        ranking[team2]!.P += 1
      default:
        break
      }
    }

    let sortedRanking = ranking.sorted { (team1, team2) -> Bool in
      if team1.value.P == team2.value.P {
        return team1.key < team2.key
      }
      return team1.value.P > team2.value.P
    }

    for team in sortedRanking {
      result.append(
        "\(team.key.padding(toLength: 31, withPad: " ", startingAt: 0))|  \(team.value.MP) |  \(team.value.W) |  \(team.value.D) |  \(team.value.L) | \(String(repeating: " ", count: 2 - String(team.value.P).count) + String(team.value.P))"
      )
    }
    return result
  }
}
