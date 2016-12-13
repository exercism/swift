import Foundation

struct SubList {

    var firstList: [Int]
    var secondList: [Int]

    func checkSubList(list_one: [Int], list_two: [Int]) -> String {

        if list_one.isEmpty && list_two.isEmpty {

            return "equal"
        } else if list_one.isEmpty && !list_two.isEmpty {

            return "sublist"

        } else if !list_one.isEmpty && list_two.isEmpty {

            return "superlist"
        } else {

            if list_one.count == list_two.count {

                if list_one == list_two {

                    return "equal"
                } else {

                    return "unequal"
                }
            } else {

                var i = 0
                var count = 0
                var smallerList = [Int]()

                var iterations = 0

                if list_one.count > list_two.count {

                    var isSuperList = false
                    iterations = list_one.count - (list_two.count - 1)

                    while iterations > 0 {

                        var j = i
                        while count <= list_two.count - 1 {

                            smallerList.append(list_one[j])
                            j+=1
                            count+=1
                        }

                        if smallerList == list_two {

                            isSuperList=true
                            break
                        } else {

                            smallerList.removeAll()
                            i+=1
                            count = 0
                        }

                        iterations-=1

                    }
                    if isSuperList {

                        return "superlist"
                    } else {

                        return "unequal"
                    }

                } else if list_two.count > list_one.count {

                    var isSubList = false
                    iterations = list_two.count - (list_one.count - 1)
                    while iterations > 0 {

                        var j = i
                        while count <= list_one.count - 1 {

                            smallerList.append(list_two[j])
                            j+=1
                            count+=1
                        }

                        if smallerList == list_one {

                            isSubList=true
                            break
                        } else {

                            smallerList.removeAll()
                            i+=1
                            count = 0
                        }

                        iterations-=1
                    }
                    if isSubList {

                        return "sublist"
                    } else {

                        return "unequal"
                    }

                }
            }
        }
        return ""
    }

}
