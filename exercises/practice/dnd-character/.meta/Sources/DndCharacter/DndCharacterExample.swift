import Foundation

func modifier(_ score: Int) -> Int {
    Int(floor(Double(score - 10) / 2))
}

func ability() -> Int {
    let dice = (1...4).map { _ in Int.random(in: 1...6) }
    return dice.sorted().dropFirst().reduce(0, +)
}

struct DndCharacter {
    let strength: Int
    let dexterity: Int
    let constitution: Int
    let intelligence: Int
    let wisdom: Int
    let charisma: Int
    let hitpoints: Int
    
    init() {
        self.strength = ability()
        self.dexterity = ability()
        self.constitution = ability()
        self.intelligence = ability()
        self.wisdom = ability()
        self.charisma = ability()
        self.hitpoints = 10 + modifier(self.constitution)
    }
}