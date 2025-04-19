# Append

You will have to implement your own equality operator for the `ComplexNumber` object.
This will pose the challenge of comparing two floating point numbers.
It might be useful to use the method `isApproximatelyEqual(to:absoluteTolerance:)` which can be found in the [Numerics][swift-numberics] library.
A given tolerance of `0.00001` should be enough to pass the tests.
The library is already imported in the project so it is just to import it in your file.

You are aLso free to implement your own method to compare the two complex numbers.

[swift-numberics]: https://github.com/apple/swift-numerics
