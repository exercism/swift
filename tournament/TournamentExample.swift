import Foundation

extension String {
    func trimWS()->String{
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet() )
    }
}

struct Tournament
{
    enum Outcome
    {
        case LOSS
        case DRAW
        case WIN
        case ERR
    }
    
    struct TeamResult
    {
        var Losses:Int = 0
        var Draws:Int = 0
        var Wins:Int = 0
        
        var Played:Int {
            return Losses + Draws + Wins
        }
        
        var Score:Int {
            return Wins * 3 + Draws
        }
        
        mutating func AddOutcome( outcome:Outcome )-> Void
        {
            switch outcome {
            case .LOSS :
                ++Losses
            case .DRAW :
                ++Draws
            case .WIN :
                ++Wins
            default :
                println("Error AddOutcome")
            }
        }
    }
    
    private var teams = Dictionary<String, TeamResult>()
    
    private mutating func newTournament() ->Void
    {
        teams = Dictionary<String, TeamResult>()
    }
    
    private mutating func AddResult(#team1:String, team2:String, outcome:Outcome) -> Void
    {
        // Invert outcome for the second team.
        var outcome2:Outcome  = (outcome == Outcome.WIN) ? Outcome.LOSS :
            (outcome == Outcome.LOSS) ? Outcome.WIN :
            Outcome.DRAW
        
        
        AddTeamOutcome(team1, outcome)
        AddTeamOutcome(team2, outcome2)
    }
    
    private var teamResult = TeamResult()
    
    private mutating func AddTeamOutcome(team:String, _ outcome:Outcome) -> Void
    {
        if teams[team] != nil {
            teamResult = teams[team]!
            teamResult.AddOutcome(outcome)
            teams[team] = teamResult
            
        } else {
            teamResult = TeamResult()
            teamResult.AddOutcome(outcome)
            teams[team] = teamResult
        }
    }
    
    private mutating func WriteResults()-> String
    {
        
        func formarter (Team:String, MP:String, W:String, D:String, L:String, P:String)->String{
            
            func wsChars(text:String, spacing:Int = 31)->String{
                return "".join(Repeat(count:abs(spacing - Array(text).count) , repeatedValue: " "))
            }
            
            func spacing(text:String, columnWith:Int = 4)->String{
                let textCount = Array(text).count
                let space = Int(round(Double(textCount) / Double(columnWith)))
                
                return wsChars(text, spacing: columnWith - space - textCount) + text + wsChars(text, spacing: space )
            }
            
            let text = "\(Team)" + wsChars(Team) + "|" + spacing(MP) + "|" + spacing(W) + "|" + spacing(D) + "|" + spacing(L) + "|" + spacing(P)
            
            return text.trimWS() + "\n"
            
        }

        var textOutput:String = ""
        
        let header = formarter("Team", "MP", "W", "D", "L", "P")
        
        textOutput += header
        
        
        func sortKeysByValue()->[String]
        {
            var sortByValue = [(String, Int)]()
            for each in teams.keys.array{
                let tempVal = teams[each]!
                sortByValue.append((each, tempVal.Score))
            }
            sortByValue.sort{$0.1 > $1.1}
            var sortedKeys = [String]()
            for each in sortByValue{
                sortedKeys.append(each.0)
            }
            
            return sortedKeys
        }

        for team in sortKeysByValue(){
            
            let result = teams[team]!
            
            let MP = result.Played
            let W  = result.Wins
            let D  = result.Draws
            let L  = result.Losses
            let P  = result.Score
            
            
            let line = formarter(team,
                "\(MP)",
                "\(W)",
                "\(D)",
                "\(L)",
                "\(P)")
            
            textOutput += line
        }
        return textOutput.trimWS()
    }
    
    mutating func tally(inStream:String) -> String
    {
        newTournament()
        var outcome:Outcome = Outcome.ERR
        
        // alternative to .componentsSeparatedByString
        let textArrayLines = split(inStream) {$0 == "\n"}
        
        for line in textArrayLines
        {
            let parts = line.trimWS().componentsSeparatedByString(";")
            if parts.count == 3
            {
                switch parts[2].lowercaseString
                {
                    case "loss":
                        outcome = Outcome.LOSS
                    case "draw":
                        outcome = Outcome.DRAW
                    case "win":
                        outcome = Outcome.WIN
                    default:
                        outcome = Outcome.ERR
                }
                
                if outcome != Outcome.ERR
                {
                    self.AddResult(team1: parts[0], team2: parts[1], outcome: outcome)
                }
            }
        }
        
        return WriteResults()
    }
    
    
    
}






