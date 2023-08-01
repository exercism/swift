func bonusPoints(powerUpActive: Bool, touchingEagle: Bool) -> Bool {
  return powerUpActive && touchingEagle
}

func score(touchingPowerUp: Bool, touchingSeed: Bool) -> Bool {
  return touchingPowerUp || touchingSeed
}

func lose(powerUpActive: Bool, touchingEagle: Bool) -> Bool {
  return !powerUpActive && touchingEagle
}

func win(HasPickedUpAllSeeds: Bool, powerUpActive: Bool, touchingEagle: Bool) -> Bool {
  return HasPickedUpAllSeeds && !lose(powerUpActive: powerUpActive, touchingEagle: touchingEagle)
}
