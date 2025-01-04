func totalBirdCount(_ birdsPerDay: [Int]) -> Int {
  var count = 0
  for day in birdsPerDay {
    count += day
  }
  return count
}

func birdsInWeek(_ birdsPerDay: [Int], weekNumber: Int) -> Int {
  var count = 0
  let startOfWeek = (weekNumber - 1) * 7
  let endOfWeek = startOfWeek + 7
  for i in startOfWeek..<endOfWeek {
    count += birdsPerDay[i]
  }
  return count
}

func fixBirdCountLog(_ birdsPerDay: [Int]) -> [Int] {
  var result = [Int](birdsPerDay)
  for i in stride(from: 0, through: birdsPerDay.count - 1, by: 2) {
    result[i] += 1
  }
  return result
}