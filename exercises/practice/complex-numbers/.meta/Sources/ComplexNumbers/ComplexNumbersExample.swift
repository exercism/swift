import Foundation
import Numerics

struct ComplexNumbers: Equatable {

  var real: Double
  var imaginary: Double

  init(realComponent: Double, imaginaryComponent: Double? = 0) {
    real = realComponent
    imaginary = imaginaryComponent ?? 0
  }

  func add(complexNumber: ComplexNumbers) -> ComplexNumbers {
    ComplexNumbers(
      realComponent: real + complexNumber.real,
      imaginaryComponent: imaginary + complexNumber.imaginary)
  }

  func sub(complexNumber: ComplexNumbers) -> ComplexNumbers {
    ComplexNumbers(
      realComponent: real - complexNumber.real,
      imaginaryComponent: imaginary - complexNumber.imaginary)
  }

  func mul(complexNumber: ComplexNumbers) -> ComplexNumbers {
    ComplexNumbers(
      realComponent: real * complexNumber.real - imaginary * complexNumber.imaginary,
      imaginaryComponent: real * complexNumber.imaginary + imaginary * complexNumber.real)
  }

  func div(complexNumber: ComplexNumbers) -> ComplexNumbers {
    let denominator =
      complexNumber.real * complexNumber.real + complexNumber.imaginary * complexNumber.imaginary
    let realComponent =
      (real * complexNumber.real + imaginary * complexNumber.imaginary) / denominator
    let imaginaryComponent =
      (imaginary * complexNumber.real - real * complexNumber.imaginary) / denominator
    return ComplexNumbers(realComponent: realComponent, imaginaryComponent: imaginaryComponent)
  }

  func absolute() -> Double {
    sqrt(Double(real * real + imaginary * imaginary))
  }

  func conjugate() -> ComplexNumbers {
    ComplexNumbers(realComponent: real, imaginaryComponent: -imaginary)
  }

  func exponent() -> ComplexNumbers {
    let expReal = exp(Double(real)) * cos(Double(imaginary))
    let expImaginary = exp(Double(real)) * sin(Double(imaginary))
    return ComplexNumbers(realComponent: expReal, imaginaryComponent: expImaginary)
  }

  static func == (lhs: ComplexNumbers, rhs: ComplexNumbers) -> Bool {
    lhs.real.isApproximatelyEqual(to: rhs.real, absoluteTolerance: 0.0001)
      && lhs.imaginary.isApproximatelyEqual(to: rhs.imaginary, absoluteTolerance: 0.0001)
  }
}
