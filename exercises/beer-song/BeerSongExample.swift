struct BeerSong {

    var numberOfBeerBottles: Int
    func generateVersesOfBeerSong() -> String {
        var verses = ""
        var numberOfBottlesOfBeer = numberOfBeerBottles
        while numberOfBottlesOfBeer > 2 {
            verses.append("\(numberOfBottlesOfBeer) bottles of beer on the wall, \(numberOfBottlesOfBeer) bottles of beer.\n")
            numberOfBottlesOfBeer -= 1
            verses.append("Take one down and pass it around, \(numberOfBottlesOfBeer) bottles of beer on the wall.\n\n")
        }
        while numberOfBottlesOfBeer <= 2 {
            switch numberOfBottlesOfBeer {
            case 2:verses.append("\(numberOfBottlesOfBeer) bottles of beer on the wall, \(numberOfBottlesOfBeer) bottles of beer.\n")
            numberOfBottlesOfBeer -= 1
            verses.append("Take one down and pass it around, \(numberOfBottlesOfBeer) bottle of beer on the wall.\n\n")

            case 1:verses.append("\(numberOfBottlesOfBeer) bottle of beer on the wall, \(numberOfBottlesOfBeer) bottle of beer.\n")
            numberOfBottlesOfBeer -= 1
            verses.append("Take one down and pass it around, no more bottles of beer on the wall.\n\n")

            case 0:verses.append("No more bottles of beer on the wall, no more bottles of beer.\n")
            numberOfBottlesOfBeer = 99
            verses.append("Go to the store and buy some more, \(numberOfBottlesOfBeer) bottles of beer on the wall.")
            default:break
            }

        }
        return verses
    }

}
