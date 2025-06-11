class GradeSchool {
  var rosters = [Int: [String]]()

   func addStudent(_ name: String, grade: Int) -> Bool {
    if rosters.values.contains(where: { $0.contains(name) }) {
      return false
    }
    rosters[grade, default: []].append(name)
    return true
  }

  func studentsInGrade(_ grade: Int) -> [String] {
    return (rosters[grade] ?? [String]()).sorted()
  }

  func roster() -> [String] {
    return rosters.keys.sorted().flatMap { (rosters[$0] ?? [String]()).sorted() }
  }
}
