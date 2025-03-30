class SpaceAge {
  var seconds: Float = 0

  var onMercury: Float { return ((seconds / 7_600_530.24) * 100).rounded() / 100 }
  var onVenus: Float { return ((seconds / 19_413_907.2) * 100).rounded() / 100 }
  var onEarth: Float { return ((seconds / 31_558_149.76) * 100).rounded() / 100 }
  var onMars: Float { return ((seconds / 59_354_294.4) * 100).rounded() / 100 }
  var onJupiter: Float { return ((seconds / 374_335_776.0) * 100).rounded() / 100 }
  var onSaturn: Float { return ((seconds / 929_596_608.0) * 100).rounded() / 100 }
  var onUranus: Float { return ((seconds / 2_661_041_808.0) * 100).rounded() / 100 }
  var onNeptune: Float { return ((seconds / 5_200_418_592.0) * 100).rounded() / 100 }

  init(_ input: Float) {
    self.seconds = input
  }
}
