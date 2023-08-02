import XCTest

@testable import VehiclePurchase

let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

class TaskCanIBuy: XCTestCase {
  func testCanBuy() {
    XCTAssertEqual(
      canIBuy(vehicle: "1974 Ford Pinto", price: 516.32, monthlyBudget: 100.00),
      "Yes! I'm getting a 1974 Ford Pinto")
  }

  func testCannotBuy() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      canIBuy(vehicle: "2011 Bugatti Veyron", price: 2_250_880.00, monthlyBudget: 10000.00),
      "Darn! No 2011 Bugatti Veyron for me")
  }

  func testBeFrugal() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      canIBuy(vehicle: "2020 Indian FTR 1200", price: 12_500, monthlyBudget: 200),
      "I'll have to be frugal if I want a 2020 Indian FTR 1200")
  }
}

class TaskLicenseType: XCTestCase {
  func testTwoWheels() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      licenseType(numberOfWheels: 2), "You will need a motorcycle license for your vehicle")
  }

  func testThreeWheels() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      licenseType(numberOfWheels: 3), "You will need a motorcycle license for your vehicle")
  }

  func testFourWheels() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      licenseType(numberOfWheels: 4), "You will need an automobile license for your vehicle")
  }

  func testFiveWheels() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      licenseType(numberOfWheels: 5), "We do not issue licenses for those types of vehicles")
  }

  func testSixWheels() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      licenseType(numberOfWheels: 6), "You will need an automobile license for your vehicle")
  }

  func testSevenWheels() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      licenseType(numberOfWheels: 7), "We do not issue licenses for those types of vehicles")
  }

  func testEighteenWheels() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      licenseType(numberOfWheels: 18),
      "You will need a commercial trucking license for your vehicle")
  }

  func testZeroWheels() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      licenseType(numberOfWheels: 0), "We do not issue licenses for those types of vehicles")
  }

  func testOneWheel() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      licenseType(numberOfWheels: 1), "We do not issue licenses for those types of vehicles")
  }
}

class TaskCalculateResellPrice: XCTestCase {
  func testPriceUnderThreeYears() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(calculateResellPrice(originalPrice: 40_000, yearsOld: 2), 32_000)
  }

  func testPriceWhenThreeYears() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(calculateResellPrice(originalPrice: 40_000, yearsOld: 3), 28_000)
  }

  func testPriceWhenSevenYears() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(calculateResellPrice(originalPrice: 50_000, yearsOld: 7), 35_000)
  }

  func testPriceWhenTenYears() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(calculateResellPrice(originalPrice: 25_000, yearsOld: 10), 12_500)
  }

  func testPriceWhenOverTenYears() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(calculateResellPrice(originalPrice: 50_000, yearsOld: 11), 25_000)
  }
}
