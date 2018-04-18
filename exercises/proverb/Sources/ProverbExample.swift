import Foundation

struct Proverb {

    func recite(_ pieces: [String]) -> String {

    var saying = String()

    if let firstPiece = pieces.first {

        for (position, piece) in pieces.enumerated() {

            if position != pieces.count - 1 {

                let nextPiece = pieces[position + 1]
                saying.append("For want of a \(piece) the \(nextPiece) was lost.\n")
            } else {

                saying.append("And all for the want of a \(firstPiece).")
            }

        }
    }

    return saying
}

}
