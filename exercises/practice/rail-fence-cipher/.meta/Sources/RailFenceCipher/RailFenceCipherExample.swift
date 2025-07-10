
func encode(_ message: String, rails: Int) -> String {
    encodeDecode(message, rails: rails, mode: .encode)
}

func decode(_ message: String, rails: Int) -> String {
    encodeDecode(message, rails: rails, mode: .decode)
}

fileprivate enum Mode {
    case encode
    case decode
}

fileprivate func encodeDecode(_ message: String, rails: Int, mode: Mode) -> String {
    var output = Array(repeating: Character(" "), count: message.count)
    let maxStep = 2 * (rails - 1)
    var posCipher = 0
    let chars = Array(message)

    for rail in 0..<rails {
        var step = (rail == 0) ? maxStep : 2 * rail
        var posText = rail

        while posText < chars.count {
            if mode == .encode {
                output[posCipher] = chars[posText]
            } else {
                output[posText] = chars[posCipher]
            }

            posCipher += 1
            step = (step == maxStep) ? maxStep : maxStep - step
            posText += step
        }
    }

    return String(output)
}