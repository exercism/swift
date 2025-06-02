import Testing
import Foundation
import RealModule

@testable import LasagnaMaster

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct LasagnaMasterTests {
  @Test("Remaning minutes explicit")
  func testRemainingMinutesExplicit() {
    #expect(remainingMinutesInOven(elapsedMinutes: 22, expectedMinutesInOven: 100) == 78)
  }

  @Test("Remaining minutes default", .enabled(if: RUNALL))
  func testRemainingMinutesDefault() {
    #expect(remainingMinutesInOven(elapsedMinutes: 22) == 18)
  }

  @Test("Preparation time", .enabled(if: RUNALL))
  func testPreparationTime() {
    #expect(
      preparationTimeInMinutes(
        layers: "sauce", "noodles", "béchamel", "meat", "mozzarella", "noodles", "ricotta",
        "eggplant", "béchamel", "noodles", "sauce", "mozzarella") == 24)
  }

  @Test("Prepatation time empty", .enabled(if: RUNALL))
  func testPreparationTimeEmpty() {
    #expect(preparationTimeInMinutes() == 0)
  }

  @Test("Quantities", .enabled(if: RUNALL))
  func testQuantities() {
    let amount = quantities(
      layers: "sauce", "noodles", "béchamel", "meat", "mozzarella", "noodles", "ricotta",
      "eggplant", "béchamel", "noodles", "sauce", "mozzarella")
    #expect(amount.noodles == 9 && amount.sauce == 0.4)
  }

  @Test("Quantities no sauce", .enabled(if: RUNALL))
  func testQuantitiesNoSauce() {
    let amount = quantities(
      layers: "noodles", "béchamel", "noodles", "ricotta", "eggplant", "mozzarella")
    #expect(amount.noodles == 6 && amount.sauce == 0)
  }

  @Test("Quantities no noodles", .enabled(if: RUNALL))
  func testQuantitiesNoNoodles() {
    let amount = quantities(
      layers: "sauce", "meat", "mozzarella", "eggplant", "béchamel", "sauce", "mozzarella")
    #expect(amount.noodles == 0 && amount.sauce == 0.4)
  }

  @Test("Quantities no sauce no noodles", .enabled(if: RUNALL))
  func testQuantitiesNoSauceNoNoodles() {
    let amount = quantities(
      layers: "meat", "mozzarella", "eggplant", "béchamel", "mozzarella")
    #expect(amount.noodles == 0 && amount.sauce == 0)
  }

  @Test("To oz", .enabled(if: RUNALL))
  func testToOz() {
    var amount = quantities(
      layers: "sauce", "noodles", "béchamel", "meat", "sauce", "noodles", "sauce", "mozzarella")
    toOz(&amount)
    #expect(amount.sauce.isApproximatelyEqual(to: 20.2884, relativeTolerance: 0.001))
  }

  @Test("Red wine red inequal layer count", .enabled(if: RUNALL))
  func testRedWineRedInequalLayerCount() {
    #expect(redWine(layers: "sauce", "noodles", "sauce", "noodles", "meat", "noodles", "mozzarella"))
  }

  @Test("Red wine red equal layer count", .enabled(if: RUNALL))
  func testRedWineRedEqualLayerCount() {
    #expect(
      redWine(
        layers: "sauce", "noodles", "ricotta", "sauce", "noodles", "béchamel", "meat", "noodles",
        "mozzarella"))
  }

  @Test("Red wine white", .enabled(if: RUNALL))
  func testRedWineWhite() {
    #expect(
      !redWine(
        layers: "sauce", "noodles", "béchamel", "meat", "mozzarella", "noodles", "sauce", "ricotta",
        "eggplant", "mozzarella", "béchamel", "noodles", "meat", "sauce", "mozzarella"))
  }
}
