struct RotationalCipher {

    static func rotate(_ target: String, ROT: Int) -> String {

        var result = ""

        target.unicodeScalars.forEach { unicode in

            switch unicode.value {
            case 65...90: // A to Z
                var scalar = unicode.value + UInt32(ROT)
                if scalar > 90 { scalar -= 26 }
                result.append(Character(UnicodeScalar(scalar)!))

            case 97...122: // a to z
                var scalar = unicode.value + UInt32(ROT)
                if scalar > 122 { scalar -= 26 }
                result.append(Character(UnicodeScalar(scalar)!))

            default:
                result.append(Character(unicode))
            }

        }

        return result

    }

}
