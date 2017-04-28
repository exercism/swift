struct GradeSchool {
    var roster = [Int: [String]]()

    mutating func addStudent(_ name: String, grade: Int) {
        if let students = roster[grade] {
            var students = students
            students.append(name)
            roster[grade] = students
        } else {
            roster[grade] = [name]
        }
    }

    func studentsInGrade(_ grade: Int) -> [String] {
        return roster[grade] ?? [String]()
    }

    var sortedRoster: [Int: [String]] {
        var sortedRoster = [Int: [String]](minimumCapacity: roster.count)
        for (grade, students) in roster {
            sortedRoster[grade] = students.sorted()
        }
        return sortedRoster
    }
}
