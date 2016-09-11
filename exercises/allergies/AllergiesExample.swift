enum Allergen: UInt {
    case eggs = 1
    case peanuts = 2
    case shellfish = 4
    case strawberries = 8
    case tomatoes = 16
    case chocolate = 32
    case pollen = 64
    case cats = 128
}

struct Allergies {

    let score: UInt

    init(_ score: UInt) {
        self.score = UInt(score)
    }

    func hasAllergy(_ allergen: Allergen) -> Bool {
        return allergen.rawValue & score == allergen.rawValue ? true : false
    }
}
