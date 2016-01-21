import Darwin

// Apple Swift version 2.1

private extension String {
    
    func trimWhiteSpace()-> String{
        let removeSpaces = trimCharacters(" ", sourceText: self)
        if removeSpaces.hasSuffix("\n"){
            return String(removeSpaces.characters.dropLast())
        }
        return  removeSpaces
        
    }
    
    func trimCharacters(charToTrim:Character, sourceText:String) -> String{
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
        
        mutating func addOutcome( outcome:Outcome )-> Void
        {
            switch outcome {
            case .LOSS :
                Losses += 1
            case .DRAW :
                Draws += 1
            case .WIN :
                Wins += 1
            default :
                print("Error addOutcome")
            }
        }
    }
    
    private var teams = Dictionary<String, TeamResult>()
    
    
    private mutating func addResult(team1 team1:String, team2:String, outcome:Outcome) -> Void
    {
        // Invert outcome for the second team.
        let outcome2:Outcome  = (outcome == Outcome.WIN) ? Outcome.LOSS :
            (outcome == Outcome.LOSS) ? Outcome.WIN :
            Outcome.DRAW
        
        
        addTeamOutcome(team1, outcome)
        addTeamOutcome(team2, outcome2)
    }
    
    private var teamResult = TeamResult()
    
    private mutating func addTeamOutcome(team:String, _ outcome:Outcome) -> Void
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
        
        func formarter (Team:String, MP:String, W:String, D:String, L:String, P:String)->String{
            
            func wsChars(text:String, spacing:Int = 31)->String{
                return Repeat(count:abs(spacing - Array(text.characters).count) , repeatedValue: " ").joinWithSeparator("")
            }
            
            func spacing(text:String, columnWith:Int = 4)->String{
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
            sortByValue.sortInPlace{$0.1 > $1.1}
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
    
    func tally(inStream:String) -> String
    {
        // Create New Tournament
        var tournament = Tournament()
        
        var outcome:Outcome = Outcome.ERR
        
        // alternative to .componentsSeparatedByString
        let textArrayLines = inStream.characters.split {$0 == "\n"}.map { String($0) }
        
        for line in textArrayLines
        {
            let parts = line.trimWhiteSpace().componentsSeparatedByString(";")
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
                    tournament.addResult(team1: parts[0], team2: parts[1], outcome: outcome)
                }
            }
        }
        
        return tournament.writeResults()
    }
    
    
    
}






