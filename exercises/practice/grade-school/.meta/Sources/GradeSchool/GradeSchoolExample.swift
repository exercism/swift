struct GradeSchool {
  var rosters = [Int: [String]]()

  mutating func addStudent(_ name: String, grade: Int) {
    
  }

  func studentsInGrade(_ grade: Int) -> [String] {
    return rosters[grade] ?? [String]()
  }

  func roster() -> [String] {
    return rosters.keys.sorted().flatMap { rosters[$0] ?? [String]() }
  }
}
