struct Raindrops {

    private var drops: Int
    var sounds: String = ""

    private func convert(_ number: Int) -> String {
        let result = (number % 3, number % 5, number % 7)
        switch result {
        case (0, 0, 0):return "PlingPlangPlong"
        case (_, 0, 0):return "PlangPlong"
        case (0, _, 0):return "PlingPlong"
        case (0, 0, _):return "PlingPlang"
        case (_, _, 0):return "Plong"
        case (_, 0, _):return "Plang"
        case (0, _, _):return "Pling"
        default:return "\(number)"
        }
    }

    init(_ value: Int) {
        self.drops = value
        self.sounds = convert(value)
    }
}
