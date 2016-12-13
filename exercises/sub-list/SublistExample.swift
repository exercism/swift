import Foundation

struct SubList {

    var firstList: [Int]
    var secondList: [Int]

    func checkSubList(listOne: [Int], listTwo: [Int]) -> String {

        if  listOne == listTwo {

            return "equal"
        } else if listOne.isEmpty || listTwo.isEmpty {

            if listOne.isEmpty {

                return "sublist"
            }
            return "superlist"

        } else if listOne.count != listTwo.count {

            var i = 0
            var count = 0
            var smallerList = [Int]()

            var iterations = 0
            iterations = max(listOne.count, listTwo.count) - (min(listOne.count, listTwo.count) - 1)

            while iterations > 0 {

                var j = i
                while count <= min(listOne.count, listTwo.count) - 1 {

                    if listOne.count > listTwo.count {

                        smallerList.append(listOne[j])

                    } else {

                        smallerList.append(listTwo[j])
                    }

                    j+=1
                    count+=1
                }

                if smallerList == listTwo {

                    return "superlist"

                } else if smallerList == listOne {

                    return "sublist"

                } else {

                    smallerList.removeAll()
                    i+=1
                    count = 0
                }

                iterations-=1

            }

        }
        return "unequal"
    }

}
