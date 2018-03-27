import Foundation

struct ComplexNumber {

    var realComponent: Double

    var imaginaryComponent: Double

    func getRealComponent() -> Double {

        return self.realComponent
    }

    func getImaginaryComponent() -> Double {

        return self.imaginaryComponent
    }

    func add(complexNumber: ComplexNumber) -> ComplexNumber {

        return ComplexNumber(realComponent: self.realComponent + complexNumber.realComponent, imaginaryComponent: self.imaginaryComponent + complexNumber.imaginaryComponent)

    }

    func subtract(complexNumber: ComplexNumber) -> ComplexNumber {

        return ComplexNumber(realComponent: self.realComponent - complexNumber.realComponent, imaginaryComponent: self.imaginaryComponent - complexNumber.imaginaryComponent)
    }

    func multiply(complexNumber: ComplexNumber) -> ComplexNumber {

        return ComplexNumber(realComponent: self.realComponent * complexNumber.realComponent - self.imaginaryComponent * complexNumber.imaginaryComponent, imaginaryComponent: self.imaginaryComponent * complexNumber.realComponent + self.realComponent * complexNumber.imaginaryComponent)
    }

    func divide(complexNumber: ComplexNumber) -> ComplexNumber {

        let amplitudeOfComplexNumber = (complexNumber.realComponent *  complexNumber.realComponent) + (complexNumber.imaginaryComponent * complexNumber.imaginaryComponent)

        let realPartOfQuotient = (self.realComponent * complexNumber.realComponent + self.imaginaryComponent * complexNumber.imaginaryComponent) / amplitudeOfComplexNumber

        let imaginaryPartOfQuotient = (self.imaginaryComponent * complexNumber.realComponent - self.realComponent * self.realComponent * complexNumber.imaginaryComponent) / amplitudeOfComplexNumber

        return ComplexNumber(realComponent: realPartOfQuotient, imaginaryComponent: imaginaryPartOfQuotient)
    }

    func conjugate() -> ComplexNumber {

        return ComplexNumber(realComponent: self.realComponent, imaginaryComponent: (-1 * self.imaginaryComponent))
    }

    func absolute() -> Double {

        return sqrt(pow(self.realComponent, 2.0) + pow(self.imaginaryComponent, 2.0))
    }

    func exponent() -> ComplexNumber {

        let realPartOfResult = cos(self.imaginaryComponent)
        let imaginaryPartOfResult = sin(self.imaginaryComponent)
        let factor = exp(self.realComponent)

        return ComplexNumber(realComponent: realPartOfResult * factor, imaginaryComponent: imaginaryPartOfResult * factor)

    }

}
