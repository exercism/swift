import Darwin



private extension String {
    
    func trimWhiteSpace()-> String{
        let removeSpaces = trimCharacters(" ", sourceText: self)
        if removeSpaces.hasSuffix("\n"){
            return String(removeSpaces.characters.dropLast())
        }
        return  removeSpaces
        
    }
    
    func trimCharacters(_ charToTrim:Character, sourceText:String) -> String{
        var editCharacterView = sourceText.characters
        var editString = String(editCharacterView)
        
        let trimFirst  = sourceText.characters.first == charToTrim
        let trimLast   = sourceText.characters.last == charToTrim
        
        if trimFirst { editCharacterView  = editCharacterView.dropFirst() }
        if trimLast { editCharacterView  = editCharacterView.dropLast() }
        
        if trimFirst || trimLast == true {
            editString = trimCharacters(charToTrim, sourceText: String(editCharacterView))
        }
        return editString
    }
}

struct Tournament
{
    enum Outcome
    {
        case loss
        case draw
        case win
        case err
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
        
        mutating func addOutcome( _ outcome:Outcome )-> Void
        {
            switch outcome {
            case .loss :
                Losses += 1
            case .draw :
                Draws += 1
            case .win :
                Wins += 1
            default :
                print("Error addOutcome")
            }
        }
    }
    
    private var teams = Dictionary<String, TeamResult>()
    
    
    private mutating func addResult(team1:String, team2:String, outcome:Outcome) -> Void
    {
        // Invert outcome for the second team.
        let outcome2:Outcome  = (outcome == Outcome.win) ? Outcome.loss :
            (outcome == Outcome.loss) ? Outcome.win :
            Outcome.draw
        
        
        addTeamOutcome(team1, outcome)
        addTeamOutcome(team2, outcome2)
    }
    
    private var teamResult = TeamResult()
    
    private mutating func addTeamOutcome(_ team:String, _ outcome:Outcome) -> Void
    {
        if teams[team] != nil {
            teamResult = teams[team]!
            teamResult.addOutcome(outcome)
            teams[team] = teamResult
            
        } else {
            teamResult = TeamResult()
            teamResult.addOutcome(outcome)
            teams[team] = teamResult
        }
    }
    
    private mutating func writeResults()-> String
    {
        
        func formarter (_ Team:String, MP:String, W:String, D:String, L:String, P:String)->String{
            
            func wsChars(_ text:String, spacing:Int = 31)->String{
                return Repeated(abs(spacing - Array(text.characters).count) , count: " ").joined(separator: "")
            }
            
            func spacing(_ text:String, columnWith:Int = 4)->String{
                let textCount = Array(text.characters).count
                let space = Int(round(Double(textCount) / Double(columnWith)))
                
                return wsChars(text, spacing: columnWith - space - textCount) + text + wsChars(text, spacing: space )
            }
            
            let text = "\(Team)" + wsChars(Team) + "|" + spacing(MP) + "|" + spacing(W) + "|" + spacing(D) + "|" + spacing(L) + "|" + spacing(P)
            
            return text.trimWhiteSpace() + "\n"
            
        }
        
        var textOutput:String = ""
        
        let header = formarter("Team", MP: "MP", W: "W", D: "D", L: "L", P: "P")
        
        textOutput += header
        
        
        func sortKeysByValue()->[String]
        {
            var sortByValue = [(String, Int)]()
            for each in Array(teams.keys){
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
                MP: "\(MP)",
                W: "\(W)",
                D: "\(D)",
                L: "\(L)",
                P: "\(P)")
            
            textOutput += line
        }
        return textOutput.trimWhiteSpace()
    }
    
    func tally(_ inStream:String) -> String
    {
        // Create New Tournament
        var tournament = Tournament()
        
        var outcome:Outcome = Outcome.err
        
        // alternative to .componentsSeparatedByString
        let textArrayLines = inStream.characters.split {$0 == "\n"}.map { String($0) }
        
        for line in textArrayLines
        {
            let parts = line.trimWhiteSpace().components(separatedBy: ";")
            if parts.count == 3
            {
                switch parts[2].lowercased()
                {
                case "loss":
                    outcome = Outcome.loss
                case "draw":
                    outcome = Outcome.draw
                case "win":
                    outcome = Outcome.win
                default:
                    outcome = Outcome.err
                }
                
                if outcome != Outcome.err
                {
                    tournament.addResult(team1: parts[0], team2: parts[1], outcome: outcome)
                }
            }
        }
        
        return tournament.writeResults()
    }
    
    
    
}






