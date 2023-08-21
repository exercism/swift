struct GradeSchool {
  var rosters = [Int: [String]]()

  mutating func addStudent(_ name: String, grade: Int) -> Bool {
    if rosters.values.contains { $0.contains(name) } {
      return false
    }
    rosters[grade, default: []].append(name)
    return true
  }

  func studentsInGrade(_ grade: Int) -> [String] {
    return (rosters[grade] ?? [String]()).sorted()
  }

  func roster() -> [String] {
    print(rosters)
    return rosters.keys.sorted().flatMap { (rosters[$0] ?? [String]()).sorted() }
  }
}
