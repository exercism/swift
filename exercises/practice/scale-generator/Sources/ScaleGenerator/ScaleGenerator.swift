import Foundation

class ScaleGenerator {
    let flatTones = ["Ab", "A", "Bb", "B", "C", "Db", "D", "Eb", "E" ,"F", "Gb", "G"]
    let sharpTones = ["A", "A#", "B", "C", "C#", "D", "D#", "E", "F" ,"F#", "G", "G#"]
    let sharpTonesTypes = ["G", "D", "A","a", "E", "B","F#", "f#","e", "b", "c♯", "g♯", "d♯", "C"]
    let translator = ["A": 3, "M": 2, "m": 1]
    var tones: [String] = []

    init (tonic: String) {
        if sharpTonesTypes.contains(tonic) {
            let tonic = tonic.capitalized
            let index = sharpTones.firstIndex(of: tonic)!
            self.tones = Array(sharpTones[index...] + sharpTones[...index])
        }else {
            let tonic = tonic.capitalized
            let index = flatTones.firstIndex(of: tonic)!
            self.tones = Array(flatTones[index...] + flatTones[...index])
        }
    }

    func chromatic() -> [String] {
        return Array(tones[0...(tones.count - 2)])
    }

    func interval(_ intervals : String) -> [String] {
        var steps : [Int] = [0]
        for char in intervals {
            steps.append(steps.last! + translator[String(char)]!)
        }
        var result : [String] = []
        for step in steps[0...(steps.count - 2)] {
            result.append(tones[step])
        }
        result.append(tones[0])
        return result
    }
}
