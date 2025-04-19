# Instructions

You are an elf working in Santa Claus' logistics division and you have been given a pair of tasks from the boss for upgrading the system's software.

## 1. Get name of the toy

The system needs to be able to get the name of a toy from the database.
The database is made of tuples of type `(name: String, quantity: Int)`.

Implement the function `getName(_:)`, that takes an argument which hold a tuple of type `(name: String, quantity: Int)`.

```swift
let toy = (name: "Doll", quantity: 10)
getName(toy)
// Returns "Doll"
```

## 2. Add a new toy to the database

The toy market is a quick and changing market, what is popular changes very rapidly.
Thereby a function which creates a new toy is needed.

Implement the function `createToy(name:amount:)`, that takes an argument `name` which holds the name of the toy, and `amount` which holds the quantity of the toy.

```swift
getName(name: "Doll", quantity: 10)
// Returns (name: "Doll", quantity: 10)
```

## 3. Update quantity of a toy

The elfs in santas workshop is constantly making more toys, and santa needs to keep track of the quantity of each toy.
To do this, the system needs to be able to update the quantity of a toy in the database.

Implement the function `updateQuantity(_:toy:Amount:)`, that takes the arguments:
- `toys` which holds an array of tuples of type `(name: String, quantity: Int)`.
- `toy` which holds the name of the toy to update.
- `amount` which holds the new quantity of the toy.

You can assume that the toy is already in the database, and don't need to check for that.

```swift
let toys = [(name: "Doll", quantity: 10), (name: "Car", quantity: 5), (name: "Train", quantity: 3)]
updateQuantity(toys, toy: "Doll", amount: 15)
// Returns [(name: "Doll", quantity: 15), (name: "Car", quantity: 5), (name: "Train", quantity: 3)]
```

## 4. Add category key to a toy

Santa wants to be able to categorize the toys in the database.
This is so they can easily find the toys when they need to make a delivery, and to be able to sort the toys in the database.

However, when the system was first implemented, the category key was forgotten.
Now the system needs to be able to add a category key to a toy in the database.

Implement the function `addCategory(_:category:)`, that takes the arguments:
- `toys` which holds an array of tuples of type `(name: String, quantity: Int)`.
- `category` which holds the category key to add to the toys.

You can assume that the toy is already in the database, and don't need to check for that.
You can also assume that there is no category key already in the toy.

```swift
let toys = [(name: "Car", quantity: 5), (name: "Train", quantity: 3)]
addCategory(toys,, category: "Vehicle")
// Returns [(name: "Car", quantity: 5, category: "Vehicle"), (name: "Train", quantity: 3, category: "Vehicle")]
```
