import Foundation
import Testing
@testable import {{ exercise|camelCase }}

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct {{ exercise|camelCase }}Tests {
    {% for case in cases %}
        {% if case.cases %}
            {% for subcase in case.cases %}
                {% if forloop.first -%}
                    @Test("{{ subcase.description }}")
                {% else -%}
                    @Test("{{ subcase.description }}", .enabled(if: RUNALL))
                {% endif -%}
                    func test{{ subcase.description|camelCase }}() {
                        #expect({{ subcase.property }}({{ subcase.input.score }}) == {{ subcase.expected }})
                    }
            {% endfor %}
        {% elif case.property == "ability" %}
            @Test("{{case.description}}", .enabled(if: RUNALL))
            func test{{ case.description|camelCase }}() {
                let abilityScore = ability()
                #expect(3...18 ~= abilityScore)
            }
        {% elif case.property == "character" %}
            @Test("{{ case.description }}", .enabled(if: RUNALL))
            func test{{ case.description|camelCase }}() {
                let character = DndCharacter()
                {% if case.uuid == "385d7e72-864f-4e88-8279-81a7d75b04ad" %}
                    let range = 3...18
                    #expect(range ~= character.strength)
                    #expect(range ~= character.dexterity)
                    #expect(range ~= character.constitution)
                    #expect(range ~= character.intelligence)
                    #expect(range ~= character.wisdom)
                    #expect(range ~= character.charisma)
                    #expect(character.hitpoints == 10 + modifier(character.constitution))
                {% elif case.uuid == "dca2b2ec-f729-4551-84b9-078876bb4808" %}
                    #expect(character.strength == character.strength)
                    #expect(character.dexterity == character.dexterity)
                    #expect(character.constitution == character.constitution)
                    #expect(character.intelligence == character.intelligence)
                    #expect(character.wisdom == character.wisdom)
                    #expect(character.charisma == character.charisma)
                {% endif %}
            }
        {% endif %}
    {% endfor %}
}