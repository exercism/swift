#if os(Linux)
    import Glibc
#elseif os(OSX)
    import Darwin
#endif

extension Int {

    init(_ value: Octal) {
        self = value.toDecimal
    }

}

struct Octal {
    private var stringValue = ""
    fileprivate var toDecimal: Int = 0
    private func isValidOctal() -> Bool {
        return (Int(stringValue) ?? -1) > -1 ? true : false
    }

    private func oct2int(_ input: String) -> Int {
        let orderedInput = Array(input.reversed())
        var tempInt: Int = 0
        for (inx, each) in orderedInput.enumerated() {
            let tempCharInt = Int("\(each)") ?? 0
            if tempCharInt > 7 { return 0 }
            let tempOctPower = Int(pow(Double(8), Double(inx)))
            tempInt += tempOctPower * tempCharInt
        }
        return tempInt
    }
    init( _ sv: String) {
        self.stringValue = sv

        if isValidOctal() {
            self.toDecimal = oct2int(sv)
        }

    }

}
