import Foundation

extension Array where Element == String {

    func recite() -> String {

    var saying = ""

    if let firstPiece = self.first {

        for (position, piece) in self.enumerated() {

            if position != self.count - 1 {

                let nextPiece = self[position + 1]
                saying.append("For want of a \(piece) the \(nextPiece) was lost.\n")
            } else {

                saying.append("And all for the want of a \(firstPiece).")
            }

        }
    }

    return saying
}

}
