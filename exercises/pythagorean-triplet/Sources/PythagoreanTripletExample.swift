#if os(Linux)
    import Glibc
#elseif os(OSX)
    import Darwin
#endif

struct Triplet {

    var a: Int, b: Int, c: Int = 0

    init(_ a: Int, _ b: Int, _ c: Int) {
        self.a = a
        self.b = b
        self.c = c
    }

    var sum: Int { return a + b + c }

    var product: Int { return a * b * c }

    var isPythagorean: Bool { return pow(Double(a), 2) + pow(Double(b), 2) == pow(Double(c), 2) }

    static func fromWhere(_ minFactor: Int = 1, maxFactor: Int, sum: Int = 0) -> [Triplet] {

        func shouldIncludeTriplet(_ sum: Int, triplet: Triplet) -> Bool {
            return triplet.isPythagorean && (sum == 0 || triplet.sum == sum)
        }

        var triplets = [Triplet]()
        for i in minFactor ..< maxFactor - 1 {
            for j in i + 1 ..< maxFactor {
                for k in j + 1 ... maxFactor {
                    let triplet = Triplet(i, j, k)
                    if shouldIncludeTriplet(sum, triplet: triplet) {
                        triplets.append(triplet)
                    }
                }
            }
        }
        return triplets
    }

}
