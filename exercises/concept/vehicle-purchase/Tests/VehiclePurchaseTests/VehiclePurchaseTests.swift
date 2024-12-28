import Testing
import Foundation

@testable import VehiclePurchase

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct VehiclePurchaseTests {
  @Test("Test if a vehicle can be bought")
  func testCanBuy() {
    #expect(canIBuy(vehicle: "1974 Ford Pinto", price: 516.32, monthlyBudget: 100.00) == "Yes! I'm getting a 1974 Ford Pinto")
  }

  @Test("Test if a vehicle cannot be bought", .enabled(if: RUNALL))
  func testCannotBuy() {
    #expect(canIBuy(vehicle: "2011 Bugatti Veyron", price: 2_250_880.00, monthlyBudget: 10000.00) == "Darn! No 2011 Bugatti Veyron for me")
  }

  @Test("Test if a vehicle can be bought with frugality", .enabled(if: RUNALL))
  func testBeFrugal() {
    #expect(canIBuy(vehicle: "2020 Indian FTR 1200", price: 12_500, monthlyBudget: 200) == "I'll have to be frugal if I want a 2020 Indian FTR 1200")
  }

  @Test("Test what license is needed for two wheels", .enabled(if: RUNALL))
  func testTwoWheels() {
    #expect(licenseType(numberOfWheels: 2) == "You will need a motorcycle license for your vehicle")
  }

  @Test("Test what license is needed for three wheels", .enabled(if: RUNALL))
  func testThreeWheels() {
    #expect(licenseType(numberOfWheels: 3) == "You will need a motorcycle license for your vehicle")
  }

  @Test("Test what license is needed for four wheels", .enabled(if: RUNALL))
  func testFourWheels() {
    #expect(licenseType(numberOfWheels: 4) == "You will need an automobile license for your vehicle")
  }

  @Test("Test what license is needed for five wheels", .enabled(if: RUNALL))
  func testFiveWheels() {
    #expect(licenseType(numberOfWheels: 5) == "We do not issue licenses for those types of vehicles")
  }

  @Test("Test what license is needed for six wheels", .enabled(if: RUNALL))
  func testSixWheels() {
    #expect(licenseType(numberOfWheels: 6) == "You will need an automobile license for your vehicle")
  }

  @Test("Test what license is needed for seven wheels", .enabled(if: RUNALL))
  func testSevenWheels() {
    #expect(licenseType(numberOfWheels: 7) == "We do not issue licenses for those types of vehicles")
  }

  @Test("Test what license is needed for eighteen wheels", .enabled(if: RUNALL))
  func testEighteenWheels() {
    #expect(licenseType(numberOfWheels: 18) == "You will need a commercial trucking license for your vehicle")
  }

  @Test("Test what license is needed for zero wheels", .enabled(if: RUNALL))
  func testZeroWheels() {
    #expect(licenseType(numberOfWheels: 0) == "We do not issue licenses for those types of vehicles")
  }

  @Test("Test what license is needed for one wheel", .enabled(if: RUNALL))
  func testOneWheel() {
    #expect(licenseType(numberOfWheels: 1) == "We do not issue licenses for those types of vehicles")
  }

  @Test("Test the resell price of a vehicle under three years old", .enabled(if: RUNALL))
  func testPriceUnderThreeYears() {
    #expect(calculateResellPrice(originalPrice: 40_000, yearsOld: 2) == 32_000)
  }

  @Test("Test the resell price of a vehicle when three years old", .enabled(if: RUNALL))
  func testPriceWhenThreeYears() {
    #expect(calculateResellPrice(originalPrice: 40_000, yearsOld: 3) == 28_000)
  }

  @Test("Test the resell price of a vehicle when seven years old", .enabled(if: RUNALL))
  func testPriceWhenSevenYears() {
    #expect(calculateResellPrice(originalPrice: 50_000, yearsOld: 7) == 35_000)
  }

  @Test("Test the resell price of a vehicle when ten years old", .enabled(if: RUNALL))
  func testPriceWhenTenYears() {
    #expect(calculateResellPrice(originalPrice: 25_000, yearsOld: 10) == 12_500)
  }

  @Test("Test the resell price of a vehicle when over ten years old", .enabled(if: RUNALL))
  func testPriceWhenOverTenYears() {
    #expect(calculateResellPrice(originalPrice: 50_000, yearsOld: 11) == 25_000)
  }
}
