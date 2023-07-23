func canIBuy(vehicle: String, price: Double, monthlyBudget: Double) -> String {
  if price / 60 < monthlyBudget {
    return "Yes! I'm getting a " + vehicle
  } else if price / 60 > monthlyBudget + 10 {
    return "Darn! No " + vehicle + " for me"
  } else {
    return "I'll have to be frugal if I want a " + vehicle
  }
}

func licenseType(numberOfWheels wheels: Int) -> String {
  if wheels == 2 || wheels == 3 {
    return "You will need a motorcycle license for your vehicle"
  } else if wheels == 4 || wheels == 6{
    return "You will need an automobile license for your vehicle"
  } else if wheels == 18 {
    return "You will need a commercial trucking license for your vehicle"
  } else {
    return "We do not issue licenses for those types of vehicles"
  }
}

func calculateResellPrice(originalPrice: Int, yearsOld: Int) -> Int {
 let percentage
  if (age < 3) {
    percentage = 80
  } else if (age > 10) {
    percentage = 50
  } else {
    percentage = 70
  }

  return Int((percentage / 100) * originalPrice)
}
