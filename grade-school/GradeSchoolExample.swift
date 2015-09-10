//Foundation not needed

class GradeSchool {
    var db: [Int: [String]] = [:]
        
    func addStudent(name: String, grade: Int) {
        if var students = db[grade] {
            students.append(name)
            db[grade] = students
        } else {
            db[grade] = [name]
        }
    }
    
    func studentsInGrade(grade: Int) -> [String]
    {
        if let students = db[grade] {
            return students
        } else {
            return []
        }
    }
    
    func sortedRoster() -> [Int: [String]] {
        var sortedDB = db
        for (grade, students) in sortedDB {
            sortedDB[grade] = students.sort(<)
        }
        return sortedDB
    }
}