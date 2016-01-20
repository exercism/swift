// Foundation not needed

// Apple Swift version 2.1

// These solutions are here to easily test multiple versions of the work arounds to XCTestCase in the Test file
// http://stackoverflow.com/questions/29478665/comparing-optional-arrays
// http://stackoverflow.com/questions/26092281/xctassertequals-with-two-dicts-in-swift

// Using Sets

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

// Using Array

//struct GradeSchool {
//    var roster = [Int: [String]]()
//
//    mutating func addStudent(name: String, grade: Int) {
//        if let students = roster[grade] {
//            var students = students
//            students.append(name)
//            roster[grade] = students
//        } else {
//            roster[grade] = [name]
//        }
//    }
//
//    func studentsInGrade(grade: Int) -> [String] {
//        return roster[grade] ?? []
//    }
//
//    var sortedRoster: [Int: [String]] {
//        var sortedRoster = [Int: [String]](minimumCapacity: roster.count)
//        for (grade, students) in roster {
//            sortedRoster[grade] = students.sort(<)
//        }
//        return sortedRoster
//    }
//}

// Class Version for Reference
//
//class GradeSchool {
//    var roster: [Int: [String]] = [:]

//    func addStudent(name: String, grade: Int) {
//        if let students = roster[grade] {
//            var students = students
//            students.append(name)
//            roster[grade] = students
//        } else {
//            roster[grade] = [name]
//        }
//    }
//    
//    func studentsInGrade(grade: Int) -> [String]
//    {
//        if let students = roster[grade] {
//            return students
//        } else {
//            return []
//        }
//    }
//    
//    var sortedRoster:[Int: [String]] {
//        var sortedDB = roster
//        for (grade, students) in sortedDB {
//            sortedDB[grade] = students.sort(<)
//        }
//        return sortedDB
//    }
//}