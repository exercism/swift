// Foundation not needed

private extension String {
    func substringWithRangeInt(intRange:Range<Int>) -> String {
        let start = self.startIndex.advancedBy(intRange.startIndex)
        let end = self.startIndex.advancedBy(intRange.endIndex)
        return self.substringWithRange(start..<end)
    }

    func substringWithRangeInt(start start:Int, end:Int) -> String {
        let range = start..<end
        return self.substringWithRangeInt(range)
    }

    var isUppercase:Bool {
        return self == self.uppercaseString
    }

    var isLowercase:Bool {
        return self == self.lowercaseString
    }
}

struct Acronym {
    static func abbreviate(inString:String) -> String {
        var previousLetter:String = ""

        func splitCamelcaseAt(currentLetter: String, inout withString previousLetter: String ) -> Bool {

            defer { previousLetter = currentLetter }

            if currentLetter == " " { return false
            } else if currentLetter.isEmpty { return false
            } else if (previousLetter.isLowercase && currentLetter.isUppercase){
                //previousLetter = currentLetter // see defer block
                return true
            }
            //previousLetter = currentLetter // see defer block
            return false
        }

        func insertSpaceAtCamelcase(inString:String)->String{
            var accumulate  = ""
            var lastIndexAdded = 0

            for (index , each) in inString.characters.map({String($0)}).enumerate() {
                if splitCamelcaseAt(each, withString: &previousLetter){
                    accumulate += inString.substringWithRangeInt(start: lastIndexAdded, end: index)+" " // inserts a space
                    lastIndexAdded = index
                }
            }
            let lastStringSection = inString.substringWithRangeInt(start: lastIndexAdded, end: inString.characters.count)
            return accumulate + lastStringSection
        }

        func splitAt(characterToCompare:Character, charToSplitAt:String = " ,-:")-> Bool{
            for each in charToSplitAt.characters{
                if each == characterToCompare{
                    return true
                }
            }
            return false
        }

        func splitStringToArray(inString:String) -> [String]{

            return inString.characters.split(isSeparator: { splitAt($0) }).map{String($0)}
        }

        return splitStringToArray(insertSpaceAtCamelcase(inString)).map({$0.uppercaseString.substringWithRangeInt(start: 0, end: 1)}).joinWithSeparator("")
    }
}
