import Testing
import Foundation
@testable import {{ exercise|camelCase }}

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct {{ exercise|camelCase }}Tests {
    {% outer: for group in cases %}
        {%- for case in group.cases %}
        {% if forloop.outer.first and forloop.first %}
            @Test("{{case.description}}")
        {% else -%}
            @Test("{{case.description}}", .enabled(if: RUNALL))
        {% endif -%}
            func test{{ case.description|camelCase }}() {
                #expect(throws:
                {%- if case.expected.error == "a and m must be coprime." -%}
                    AffineCipherError.keysNotCoprime
                {%- else -%}
                    Never.self
                {%- endif -%}
                ) {
                    {%- if case.expected.error %}
                        let _
                    {%- else -%}
                        let actual
                    {% endif -%}
                    = try AffineCipher().{{ case.property }}("{{ case.input.phrase }}", keyA: {{ case.input.key.a }}, keyB: {{ case.input.key.b }})
                    {%- if not case.expected.error %}
                        #expect(actual == "{{ case.expected }}")
                    {% endif -%}
                }
            }
        {% endfor %}
    {% endfor %}
}
