#if os(Linux)
    import Glibc
#elseif os(OSX)
    import Darwin
#endif

struct SpaceAge {
    var seconds: Float = 0

    var onMercury: Float { return round((seconds / 7_600_530.24) * 100) / 100 }
    var onVenus: Float { return round((seconds / 19_413_907.2) * 100) / 100 }
    var onEarth: Float { return round((seconds / 31_558_149.76) * 100) / 100 }
    var onMars: Float { return round((seconds / 59_354_294.4) * 100) / 100 }
    var onJupiter: Float { return round((seconds / 374_335_776.0) * 100) / 100 }
    var onSaturn: Float { return round((seconds / 929_596_608.0) * 100) / 100 }
    var onUranus: Float { return round((seconds / 2_661_041_808.0) * 100) / 100 }
    var onNeptune: Float { return round((seconds / 5_200_418_592.0) * 100) / 100 }

    init(_ input: Float) {
        self.seconds = input
    }

}
