struct Tournament {

    private enum Outcome: String {
        case win
        case draw
        case loss
    }

    private struct Team {
        let name: String
        var wins: Int = 0
        var draws: Int = 0
        var losses: Int = 0

        init(name: String) {
            self.name = name
        }

        var matchesPlayed: Int {
            return wins + draws + losses
        }

        var points: Int {
            return wins * 3 + draws
        }
    }

    private func parseInputIntoTeams(_ input: String) -> [Team] {
        let lines = input.split(separator: "\n")

        var teams = [String: Team]()

        for line in lines {
            let components = line.split(separator: ";").map { String($0) }

            guard components.count == 3 else { continue }

            let name1 = components[0]
            let name2 = components[1]

            guard let outcome = Outcome(rawValue: components[2]) else {
                continue
            }

            var team1 = teams[name1] ?? Team(name: name1)
            var team2 = teams[name2] ?? Team(name: name2)

            switch outcome {
            case .win:
                team1.wins += 1
                team2.losses += 1
            case .draw:
                team1.draws += 1
                team2.draws += 1
            case .loss:
                team1.losses += 1
                team2.wins += 1
            }

            teams[name1] = team1
            teams[name2] = team2
        }

        return teams.map { $0.value }
    }

    private func sortTeams(_ teams: [Team]) -> [Team] {
        let sorted = teams.sorted { team1, team2 -> Bool in
            if team1.points == team2.points {
                if team1.wins == team2.wins {
                    return team1.name < team2.name
                } else {
                    return team1.wins > team2.wins
                }
            } else {
                return team1.points > team2.points
            }
        }

        return sorted
    }

    func tally(_ input: String) -> String {
        let teams = parseInputIntoTeams(input)
        let sortedTeams = sortTeams(teams)

        var result = "Team                           | MP |  W |  D |  L |  P"

        for team in sortedTeams {
            let name = team.name
            result += "\n\(name)"
            let numberOfSpaces = 31 - name.count
            for _ in 1...numberOfSpaces {
                result += " "
            }
            result += "|  \(team.matchesPlayed) |  \(team.wins) |  \(team.draws) |  \(team.losses) |  \(team.points)"
        }

        return result
    }
}
