# Instructions

A new poetry club has opened in town, and you're thinking of attending.
Because there have been incidents in the past, the club has a very specific door policy which you'll need to master, before attempting entry.

There are two doors at the poetry club, both are guarded.
In order to gain entry, you'll need to work out the password of that day:

## 1. Split a string into individual lines

The first thing you need to do is split the poem into individual lines.
The guard will recite a poem, and you will have to split it into lines.

Implement the function `splitOnNewlines` that takes a string and splits it into an array of strings, using the newline character as the delimiter.
The function should return an array of strings, where each string is a line from the poem.

```swift
splitOnNewlines("Hello.\nHow are you?\n\nI'm doing fine.")
// returns ["Hello." ,"How are you?", "", "I'm doing fine"].
```

## 2. Front door

1. The guard will recite a poem
2. You will have to split the poem into individual lines.
3. You will have to get the first letter of each line.
4. You will have to ensable the letters, which will form a word.

For example, one of their favorite writers is Michael Lockwood, who's written the following _acrostic_ poem, which means that the first letter of each sentence form a word:

```text
Stands so high
Huge hooves too
Impatiently waits for
Reins and harness
Eager to leave
```

When the guard recites the poem, you will split it into individual lines and respond with the first letters of each line, i.e. `["S", "H", "I", "R", "E"]`.

The guard will then give you the word formed by the array of letters you replied with for you to put into capitalized word form.
Finally the password you return is `"SHIRE"`, and you'll get in.

Implement the function `frontDoorPassword` that takes a string which represents the poem.
The function should return the password that you would give to the guard.

```swift
frontDoorPassword("Stands so high\nHuge hooves too\nImpatiently waits for\nReins and harness\nEager to leave")
// returns "SHIRE"
```

## 3. Back door

In the back of the club you'll find the most renowned poets, which is like the VIP area.
Because this is not for everyone, the back door process is a bit more convoluted.

1. The guard will recite a poem.
2. You will have to split the poem into lines.
3. You will have to get the last letter of each line.
   - The line will sometimes have trailing spaces, so you will need to strip them off.
4. You will have to assemble the letters and then add `", please."` to the end of the word formed by the letters.

For example, the poem mentioned before is also _telestich_, which means that the last letter of each sentence form a word:

```text
Stands so high
Huge hooves too
Impatiently waits for
Reins and harness
Eager to leave
```

When the guard recites the poem, you will split it into individual lines, strip off any trailing spaces, and respond with the first letters of each line, i.e. `["h", "o", "r", "s", "e"]`.

The guard will then give you the word formed by the array of letters you replied with for you to put into capitalized word form and append `", please."`.
Finally the password you return is `"horse, please."`, and you'll get in.

Implement the function `backDoorPassword` that takes a string which represents the poem.
The function should return the password that you would give to the guard.

```swift
backDoorPassword("Stands so high\nHuge hooves too\nImpatiently waits for\nReins and harness\nEager to leave")
// returns "horse, please."
```

## 4. Secret room

Inside the back room of the club is another door that leads to the secret room that only the very top poets may enter.

1. The guard will recite a poem.
2. You will have to split the poem into lines.
3. You will have to get the i<sup>th</sup> letter of the i<sup>th</sup> line. 
4. You will have to assemble the letters and then add `"!"` to the end of the word formed by the letters.
5. You will have to put the word in uppercased form.

For example, a modified version of the poem mentioned before fits this pattern:

```text
Stands so high
Huge hooves too
Impatiently waits for
Rider with harness
Eager to leave
```

When the guard recites the poem, you will split it into individual lines, strip off any trailing spaces, and respond with the i<sup>th</sup> letters of each line, i.e. ["S", "u", "p", "e", "r"].

The guard will then give you the word formed by the array of letters you replied with for you to put into uppercased word form and append `"!"`.
Finally the password you return is `SUPER!`, and you'll get in.

Implement the function `secretRoomPassword` that takes a string which represents the poem.
The function should return the password that you would give to the guard.

```swift
secretRoomPassword("Stands so high\nHuge hooves too\nImpatiently waits for\nRider with harness\nEager to leave")
// returns "SUPER!"
```
