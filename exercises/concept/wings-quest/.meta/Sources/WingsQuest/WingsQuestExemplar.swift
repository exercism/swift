func bonusPoints(powerUpActive : Bool, touchingAnotherBird : Bool) -> Bool {
    return powerUpActive && touchingAnotherBird
}

func score(touchingPowerUp : Bool, touchingSeed : Bool) -> Bool {
    return touchingPowerUp || touchingSeed
}

func lose(powerUpActive : Bool, touchingAnotherBird : Bool) -> Bool{
    return !powerUpActive && touchingAnotherBird
}

func win(HasPickedUpAllSeeds : Bool, powerUpActive : Bool, touchingAnotherBird : Bool) -> Bool{
    return HasPickedUpAllSeeds && !lose(powerUpActive: powerUpActive, touchingAnotherBird: touchingAnotherBird)
}