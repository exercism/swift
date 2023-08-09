enum SeriesError: Error {
  case sliceLengthLongerThanSeries
  case sliceLengthZeroOrLess
  case emptySeries
}

class Series {
  let series: String
  init(_ series: String) {
    self.series = series
  }
  func slice(_ length: Int) throws -> [String] {
    guard !series.isEmpty else { throw SeriesError.emptySeries }
    guard length <= series.count else { throw SeriesError.sliceLengthLongerThanSeries }
    guard length > 0 else { throw SeriesError.sliceLengthZeroOrLess }
    var result: [String] = []
    for i in 0...series.count - length {
      let start = series.index(series.startIndex, offsetBy: i)
      let end = series.index(start, offsetBy: length)
      result.append(String(series[start..<end]))
    }
    return result
  }
}
