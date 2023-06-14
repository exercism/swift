let expectedMinutesInOven = 40

func remainingMinutesInOven(elapsedMinutes minutes: Int) -> Int {
  return expectedMinutesInOven - minutes
}

func preparationTimeInMinutes(layers: Int) -> Int {
  return 2 
}

func totalTimeInMinutes(layers: Int, elapsedMinutes minutes: Int) -> Int {
  return preparationTimeInMinutes(layers: layers) + minutes
}
