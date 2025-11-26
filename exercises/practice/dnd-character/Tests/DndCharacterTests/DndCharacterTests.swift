import Foundation
import Testing

@testable import DndCharacter

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct DndCharacterTests {

  @Test("ability modifier for score 3 is -4")
  func testAbilityModifierForScore3Is4() {
    #expect(modifier(3) == -4)
  }

  @Test("ability modifier for score 4 is -3", .enabled(if: RUNALL))
  func testAbilityModifierForScore4Is3() {
    #expect(modifier(4) == -3)
  }

  @Test("ability modifier for score 5 is -3", .enabled(if: RUNALL))
  func testAbilityModifierForScore5Is3() {
    #expect(modifier(5) == -3)
  }

  @Test("ability modifier for score 6 is -2", .enabled(if: RUNALL))
  func testAbilityModifierForScore6Is2() {
    #expect(modifier(6) == -2)
  }

  @Test("ability modifier for score 7 is -2", .enabled(if: RUNALL))
  func testAbilityModifierForScore7Is2() {
    #expect(modifier(7) == -2)
  }

  @Test("ability modifier for score 8 is -1", .enabled(if: RUNALL))
  func testAbilityModifierForScore8Is1() {
    #expect(modifier(8) == -1)
  }

  @Test("ability modifier for score 9 is -1", .enabled(if: RUNALL))
  func testAbilityModifierForScore9Is1() {
    #expect(modifier(9) == -1)
  }

  @Test("ability modifier for score 10 is 0", .enabled(if: RUNALL))
  func testAbilityModifierForScore10Is0() {
    #expect(modifier(10) == 0)
  }

  @Test("ability modifier for score 11 is 0", .enabled(if: RUNALL))
  func testAbilityModifierForScore11Is0() {
    #expect(modifier(11) == 0)
  }

  @Test("ability modifier for score 12 is +1", .enabled(if: RUNALL))
  func testAbilityModifierForScore12Is1() {
    #expect(modifier(12) == 1)
  }

  @Test("ability modifier for score 13 is +1", .enabled(if: RUNALL))
  func testAbilityModifierForScore13Is1() {
    #expect(modifier(13) == 1)
  }

  @Test("ability modifier for score 14 is +2", .enabled(if: RUNALL))
  func testAbilityModifierForScore14Is2() {
    #expect(modifier(14) == 2)
  }

  @Test("ability modifier for score 15 is +2", .enabled(if: RUNALL))
  func testAbilityModifierForScore15Is2() {
    #expect(modifier(15) == 2)
  }

  @Test("ability modifier for score 16 is +3", .enabled(if: RUNALL))
  func testAbilityModifierForScore16Is3() {
    #expect(modifier(16) == 3)
  }

  @Test("ability modifier for score 17 is +3", .enabled(if: RUNALL))
  func testAbilityModifierForScore17Is3() {
    #expect(modifier(17) == 3)
  }

  @Test("ability modifier for score 18 is +4", .enabled(if: RUNALL))
  func testAbilityModifierForScore18Is4() {
    #expect(modifier(18) == 4)
  }

  @Test("random ability is within range", .enabled(if: RUNALL))
  func testRandomAbilityIsWithinRange() {
    let abilityScore = ability()
    #expect(3...18 ~= abilityScore)
  }

  @Test("random character is valid", .enabled(if: RUNALL))
  func testRandomCharacterIsValid() {
    let character = DndCharacter()

    let range = 3...18
    #expect(range ~= character.strength)
    #expect(range ~= character.dexterity)
    #expect(range ~= character.constitution)
    #expect(range ~= character.intelligence)
    #expect(range ~= character.wisdom)
    #expect(range ~= character.charisma)
    #expect(character.hitpoints == 10 + modifier(character.constitution))
  }

  @Test("each ability is only calculated once", .enabled(if: RUNALL))
  func testEachAbilityIsOnlyCalculatedOnce() {
    let character = DndCharacter()
    #expect(character.strength == character.strength)
    #expect(character.dexterity == character.dexterity)
    #expect(character.constitution == character.constitution)
    #expect(character.intelligence == character.intelligence)
    #expect(character.wisdom == character.wisdom)
    #expect(character.charisma == character.charisma)
  }

}
