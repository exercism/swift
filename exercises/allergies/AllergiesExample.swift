// Foundation not needed

enum Allergen: UInt {
    case Eggs = 1
    case Peanuts = 2
    case Shellfish = 4
    case Strawberries = 8
    case Tomatoes = 16
    case Chocolate = 32
    case Pollen = 64
    case Cats = 128
}

struct Allergies {
    let score: UInt

    init(_ score: UInt) {
        self.score = UInt(score)
    }

    func hasAllergy(allergen: Allergen) -> Bool {
        return allergen.rawValue & score == allergen.rawValue ? true : false
    }
}
