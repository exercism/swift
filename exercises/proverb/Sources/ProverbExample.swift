import Foundation

struct ProverbExample {

    func recite(pieces: [String]) -> String {

    var saying = String()

    if !pieces.isEmpty {

        for (position, piece) in pieces.enumerated() {

            if position != pieces.index(pieces.endIndex, offsetBy: -1) {

                let nextPiece = pieces[position + 1]
                saying.append("For want of a \(piece) the \(nextPiece) was lost.\n")
            } else {

                saying.append("And all for the want of a \(pieces.first!).")
            }

        }
    }

    return saying
}

}
