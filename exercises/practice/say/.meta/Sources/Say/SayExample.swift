enum SayError: Error {
  case outOfRange
}

let numberNames = [
  0: "zero",
  1: "one",
  2: "two",
  3: "three",
  4: "four",
  5: "five",
  6: "six",
  7: "seven",
  8: "eight",
  9: "nine",
]

let teenNames = [
  10: "ten",
  11: "eleven",
  12: "twelve",
  13: "thirteen",
  14: "fourteen",
  15: "fifteen",
  16: "sixteen",
  17: "seventeen",
  18: "eighteen",
  19: "ninteen",
]

let tensNames = [
  2: "twenty",
  3: "thirty",
  4: "forty",
  5: "fifty",
  6: "sixty",
  7: "seventy",
  8: "eighty",
  9: "ninety",
]

let bigNames = [
  100: "hundred",
  1000: "thousand",
  1_000_000: "million",
  1_000_000_000: "billion",
]

func say(number: Int) throws -> String {
  var result = ""
  var number = number
  if number < 0 || number > 999_999_999_999 {
    print("hi")
    throw SayError.outOfRange
  }

  if number == 0 {
    return "zero"
  }

  for (value, name) in bigNames.sorted(by: >) {
    if number >= value {
      let times = number / value
      number = number % value
      if times > 0 {
        result += try say(number: times) + " " + name
        if number > 0 {
          result += " "
        }
      }
    }
  }

  if number >= 20 {
    let times = number / 10
    number = number % 10
    result += tensNames[times]!
    if number > 0 {
      result += "-" + numberNames[number]!
    }
  } else if number >= 10 {
    result += teenNames[number]!
  } else if number > 0 {
    result += numberNames[number]!
  }

  return result
}
