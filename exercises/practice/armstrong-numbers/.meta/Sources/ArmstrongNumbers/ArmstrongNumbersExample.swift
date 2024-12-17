import Foundation

func isArmstrongNumber(_ number: Int) -> Bool {
    let stringNumber = String(number)
    let numberLength = stringNumber.count
    let sum: Int = stringNumber.compactMap { Int(String($0)) }.reduce(0) { $0 + Int(pow(Double($1), Double(numberLength))) }
    return sum == number
}
