struct GradeSchool {
    var roster = [Int: Array<String>]()

    mutating func addStudent(_ name: String, grade: Int) {
        if let students = roster[grade] {
            var students = students
            students.append(name)
            roster[grade] = students
        } else {
            roster[grade] = [name]
        }
    }

    func studentsInGrade(_ grade: Int) -> Array<String> {
        return roster[grade] ?? Array<String>()
    }

    var sortedRoster: [Int: Array<String>] {
        var sortedRoster = [Int: Array<String>](minimumCapacity: roster.count)
        for (grade, students) in roster {
            sortedRoster[grade] = students.sorted()
        }
        return sortedRoster
    }
}