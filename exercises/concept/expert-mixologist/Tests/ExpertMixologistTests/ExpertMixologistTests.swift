import Testing
import Foundation

@testable import ExpertMixologist

typealias DrinkTrack = (first: String, last: String, total: Int)?

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "true"]) ?? false

@Suite struct MasterMixologistTests {
  func checkTest(e: DrinkTrack, g: DrinkTrack) -> Bool {
    guard let expected = e, let got = g else { return e == nil && g == nil }
    return expected.first == got.first && expected.last == got.last && expected.total == got.total
  }

  let orders = [
    ["beer"], ["water"], ["soda"], ["shot"], ["mixed drink"], ["fancy drink"], ["frozen drink"],
    ["beer", "shot", "fancy drink"],
    ["beer", "shot", "water", "fancy drink", "frozen drink", "fancy drink"],
    ["mixed drink", "water", "soda", "soda", "beer"], Array(repeating: "frozen drink", count: 10),
  ]

  @Test("timeToPrepare")
  func testTimeToPrepare() {
    #expect([0.5, 0.5, 0.5, 1, 1.5, 2.5, 3, 4, 10, 3.5, 30] == orders.map(timeToPrepare))
  }

  @Test("makeWedges", .enabled(if: RUNALL))
  func testMakeWedges() {
    let got = makeWedges(
      needed: 42, limes: ["small", "large", "large", "medium", "small", "large", "large"])
    #expect(6 == got, "You need to use 6 limes to fill the bin; you said you need \(got).")
  }

  @Test("makeWedges with no need", .enabled(if: RUNALL))
  func testMakeWedgesNoNeed() {
    let got = makeWedges(
      needed: 0, limes: ["small", "large", "large", "medium", "small", "large", "large"])
    #expect(0 == got, "Your bin was full, so you used 0 limes; you said you used \(got).")
  }

  @Test("makeWedges with no limes", .enabled(if: RUNALL))
  func testMakeWedgesNoLimes() {
    let got = makeWedges(needed: 42, limes: [])
    #expect(0 == got, "You have no limes to cut up so you used 0 limes; you said you used \(got).")
  }

  @Test("makeWedges with too few limes", .enabled(if: RUNALL))
  func testMakeWedgesTooFewLimes() {
    let got = makeWedges(
      needed: 80, limes: ["small", "large", "large", "medium", "small", "large", "large"])
    #expect(7 == got, "You used 7 limes before you ran out of limes; you said you used \(got).")
  }

  @Test("finishShift", .enabled(if: RUNALL))
  func testFinishShift() {
    let got = finishShift(minutesLeft: 12, remainingOrders: orders)
    let expected = Array(orders.dropFirst(8))
    #expect(expected == got, "You were expected to leave the orders \(expected) for the next shift; you left \(got).")
  }

  @Test("finishShift just run over", .enabled(if: RUNALL))
  func testFinishShiftJustRunOver() {
    let got = finishShift(minutesLeft: 30, remainingOrders: orders)
    let expected: [[String]] = []
    #expect(expected == got, "You were expected to leave the orders \(expected) for the next shift; you left \(got).")
  }

  @Test("finishShift leave early", .enabled(if: RUNALL))
  func testFinishShiftLeaveEarly() {
    let got = finishShift(minutesLeft: 120, remainingOrders: orders)
    let expected: [[String]] = []
    #expect(expected == got, "You were expected to leave the orders \(expected) for the next shift; you left \(got).")
  }

  @Test("finishShift no orders", .enabled(if: RUNALL))
  func testFinishShiftNoOrders() {
    let got = finishShift(minutesLeft: 12, remainingOrders: [])
    let expected: [[String]] = []
    #expect(expected == got, "You were expected to leave the orders \(expected) for the next shift; you left \(got).")
  }

  @Test("orderTracker", .enabled(if: RUNALL))
  func testOrderTracker() {
    let orders = [
      (drink: "beer", time: "10:01"), (drink: "soda", time: "10:02"),
      (drink: "shot", time: "10:05"), (drink: "fancy drink", time: "10:06"),
      (drink: "soda", time: "10:09"), (drink: "beer", time: "10:15"),
      (drink: "beer", time: "10:22"), (drink: "water", time: "10:26"),
      (drink: "beer", time: "10:28"), (drink: "soda", time: "10:33"),
    ]
    let expectedBeers: DrinkTrack = (first: "10:01", last: "10:28", total: 4)
    let expectedSodas: DrinkTrack = (first: "10:02", last: "10:33", total: 3)
    let got = orderTracker(orders: orders)
    #expect(
      checkTest(e: expectedBeers, g: got.beer) && checkTest(e: expectedSodas, g: got.soda),
      "Expected (beer: \(expectedBeers!), soda: \(expectedSodas!)), got: \(got)")
  }

  @Test("orderTracker one each", .enabled(if: RUNALL))
  func testOrderOneEach() {
    let orders = [
      (drink: "beer", time: "10:01"), (drink: "soda", time: "10:02"),
      (drink: "shot", time: "10:05"), (drink: "fancy drink", time: "10:06"),
      (drink: "water", time: "10:26"),
    ]
    let expectedBeers: DrinkTrack = (first: "10:01", last: "10:01", total: 1)
    let expectedSodas: DrinkTrack = (first: "10:02", last: "10:02", total: 1)
    let got = orderTracker(orders: orders)
    #expect(
      checkTest(e: expectedBeers, g: got.beer) && checkTest(e: expectedSodas, g: got.soda),
      "Expected (beer: \(expectedBeers!), soda: \(expectedSodas!)), got: \(got)")
  }

  @Test("orderTracker no beer", .enabled(if: RUNALL))
  func testOrderTrackerNoBeer() {
    let orders = [
      (drink: "soda", time: "10:02"), (drink: "shot", time: "10:05"),
      (drink: "fancy drink", time: "10:06"), (drink: "soda", time: "10:09"),
      (drink: "water", time: "10:26"), (drink: "soda", time: "10:33"),
    ]
    let expectedBeers: DrinkTrack = nil
    let expectedSodas: DrinkTrack = (first: "10:02", last: "10:33", total: 3)
    let got = orderTracker(orders: orders)
    #expect(
      checkTest(e: expectedBeers, g: got.beer) && checkTest(e: expectedSodas, g: got.soda),
      "Expected (beer: nil, soda: \(expectedSodas!)), got: \(got)")
  }

  @Test("orderTracker no soda", .enabled(if: RUNALL))
  func testOrderTrackerNoSoda() {
    let orders = [
      (drink: "beer", time: "10:01"), (drink: "shot", time: "10:05"),
      (drink: "fancy drink", time: "10:06"), (drink: "beer", time: "10:15"),
      (drink: "beer", time: "10:22"), (drink: "water", time: "10:26"),
      (drink: "beer", time: "10:28"),
    ]
    let expectedBeers: DrinkTrack = (first: "10:01", last: "10:28", total: 4)
    let expectedSodas: DrinkTrack = nil
    let got = orderTracker(orders: orders)
    #expect(
      checkTest(e: expectedBeers, g: got.beer) && checkTest(e: expectedSodas, g: got.soda),
      "Expected (beer: \(expectedBeers!), soda: nil), got: \(got)")
  }

  @Test("orderTracker nils", .enabled(if: RUNALL))
  func testOrderTrackerNils() {
    let orders = [(drink: String, time: String)]()
    let expectedBeers: DrinkTrack = nil
    let expectedSodas: DrinkTrack = nil
    let got = orderTracker(orders: orders)
    #expect(
      checkTest(e: expectedBeers, g: got.beer) && checkTest(e: expectedSodas, g: got.soda),
      "Expected (beer: nil, soda: nil), got: \(got)")
  }
}
