# Instructions

In this exercise, you'll be writing code to help a freelancer communicate with a project manager.
Your task is to provide a few utilities to quickly calculate daily and monthly rates, optionally with a given discount.

We first establish a few rules between the freelancer and the project manager:

- The daily rate is 8 times the hourly rate.
- A month has 22 billable days.

Sometimes, the freelancer is offering to apply a discount on their daily rate (for example for their most loyal customers or not-for-profit customers).

Discounts are modeled as fractional numbers representing percentages, for example, `25.0` (25%).

## 1. Calculate the daily rate given an hourly rate

Implement a function called `dailyRateFrom` to calculate the daily rate given an hourly rate as a parameter.
The contract defines that a day has 8 billable hours.

```swift
dailyRateFrom(hourlyRate: 60)
// Returns 480.0
```

The returned daily rate should be a `Double`.

## 2. Calculate the monthly rate, given an hourly rate and a discount

Implement a `monthlyRateFrom` function to calculate the discounted monthly rate.
It takes two parameters, an hourly rate and the discount in percent.


```swift
monthlyRateFrom(hourlyRate: 77, withDiscount: 10.5)
// Returns 12129
```

The returned monthly rate should be rounded up (take the ceiling) to the nearest integer.

## 3. Calculate the number of complete workdays given a budget, hourly rate, and discount

Implement a function `workdaysIn` that takes a budget, an hourly rate, and a discount, and calculates how many complete days of work that covers.

```swift
workdaysIn(budget: 20000, hourlyRate: 80, withDiscount: 11.0)
// Returns 35.0
```
The returned number of days should be rounded down (take the floor) to the next integer.
