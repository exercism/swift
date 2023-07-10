# Instructions

In this exercise you will be writing code to help a freelancer communicate with their clients about the prices of certain projects. You will write a few utility functions to quickly calculate the costs for the clients.

## 1. Calculate the daily rate given an hourly rate

A client contacts the freelancer to enquire about their rates.
The freelancer explains that they **_work 8 hours a day._**
However, the freelancer knows only their hourly rates for the project.
Help them estimate a day rate given an hourly rate.

Implement the function `dailyRateFrom(hourlyRate:)`, that takes the argument `hourlyRate` which holds the freelancers hourly rate.  
The function should return the daily rate based on the hourly rate.

```swift
dailyRateFrom(hourlyRate: 60)
// => 480.0
```

The returned daily rate should be a `Double`.

## 2. Calculate the monthly rate, given an hourly rate and a discount

Another day, a project manager offers the freelancer to work on a project with a fixed budget.
Given the fixed budget and the freelancer's hourly rate, help them calculate the number of days they would work until the budget is exhausted.
The result _must_ be **rounded down** to the nearest whole number.

Implement the function `monthlyRateFrom(hourlyRate:withDiscount:)`, that takes the arguments `hourlyRate` which holds the freelancers hourly rate, and `withDiscount` which holds the discount the freelancer is willing to give to the client.
The function should return the monthly rate rounded down.

```swift
monthlyRateFrom(hourlyRate: 77, withDiscount: 10.5)
// => 12129
```

## 3. Calculate the number of workdays given a budget, hourly rate and discount

Often, the freelancer's clients hire them for projects spanning over multiple months.
In these cases, the freelancer decides to offer a discount for every full month, and the remaining days are billed at day rate.
**_Every month has 22 billable days._**
Help them estimate their cost for such projects, given an hourly rate, the number of days the project spans, and a monthly discount rate.
The discount is always passed as a number, where `42%` becomes `0.42`. The result _must_ be **rounded up** to the nearest whole number.

Implement the function `workdaysIn(budget:hourlyRate:withDiscount:)`, that takes the arguments:
- `budget` which holds the budget for the project.
- `hourlyRate` which holds the freelancers hourly rate.
- `withDiscount` which holds the discount the freelancer is willing to give to the client.
The function should return the number of workdays the freelancer will work on the project rounded up.

```swift
workdaysIn(budget: 20000, hourlyRate: 80, withDiscount: 11.0)
// => 35.0
```
