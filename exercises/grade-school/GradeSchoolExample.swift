// Foundation not needed




struct GradeSchool {
    var roster = [Int: Set<String>]()
    
    mutating func addStudent(name: String, grade: Int) {
        if let students = roster[grade] {
            var students = students
            students.insert(name)
            roster[grade] = students
        } else {
            roster[grade] = Set(arrayLiteral: name)
        }
    }
    
    func studentsInGrade(grade: Int) -> Set<String> {
        return roster[grade] ?? Set<String>()
    }
    
    var sortedRoster: [Int: Set<String>] {
        var sortedRoster = [Int: Set<String>](minimumCapacity: roster.count)
        for (grade, students) in roster {
            sortedRoster[grade] = Set(students.sort())
        
        }
        return sortedRoster
    }
}
