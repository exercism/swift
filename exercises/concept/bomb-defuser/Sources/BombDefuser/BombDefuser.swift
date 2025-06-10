typealias ChangeClosure = @Sendable ((String, String, String)) -> (String, String, String)

//let flip: ChangeClosure = TODO: Please define the flip closure
//
//
//let rotate: ChangeClosure = TODO: Please define the rotate closure

func makeShuffle(
  flipper: @escaping ((String, String, String)) -> (String, String, String),
  rotator: @escaping ((String, String, String)) -> (String, String, String)
) -> ([UInt8], (String, String, String)) -> (String, String, String) {
  fatalError("Please implement the makeShuffle(flipper:rotator:) function")
}
