//Foundation not needed

struct Allergies {
    private var value: UInt = 0
    init(_ value: UInt) { self.value = value }
    var boolValue: Bool { return self.value != 0 }
    func toRaw() -> UInt { return self.value }
    static func fromRaw(raw: UInt) -> Allergies? { return self.init(raw) }
    static func fromMask(raw: UInt) -> Allergies { return self.init(raw) }
    static func convertFromNilLiteral() -> Allergies { return self.init(0) }
    
    func hasAllergy(testAgainst: Allergies) -> Bool {
        return self.value & testAgainst.value  > 0
    }
    
    static var None: Allergies { return self.init(0) }
    static var eggs: Allergies { return Allergies(1 << 0) }
    static var peanuts: Allergies { return Allergies(1 << 1) }
    static var shellfish: Allergies { return Allergies(1 << 2) }
    static var strawberries: Allergies { return Allergies(1 << 3) }
    static var tomatoes: Allergies { return Allergies(1 << 4) }
    static var chocolate: Allergies { return Allergies(1 << 5) }
    static var pollen: Allergies { return Allergies(1 << 6) }
    static var cats: Allergies { return Allergies(1 << 7) }
}
func == (lhs: Allergies, rhs: Allergies) -> Bool { return lhs.value == rhs.value }
