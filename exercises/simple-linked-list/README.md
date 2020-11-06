# Simple Linked List

Write a simple linked list implementation that uses Elements and a List.

The linked list is a fundamental data structure in computer science,
often used in the implementation of other data structures. They're
pervasive in functional programming languages, such as Clojure, Erlang,
or Haskell, but far less common in imperative languages such as Ruby or
Python.

The simplest kind of linked list is a singly linked list. Each element in the
list contains data and a "next" field pointing to the next element in the list
of elements.

This variant of linked lists is often used to represent sequences or
push-down stacks (also called a LIFO stack; Last In, First Out).

As a first take, lets create a singly linked list to contain the range (1..10),
and provide functions to reverse a linked list and convert to and from arrays.

When implementing this in a language with built-in linked lists,
implement your own abstract data type.

## Setup

Go through the project setup instructions for Xcode using Swift:

http://exercism.io/languages/swift  
http://exercism.io/languages/swift/tests

Notably, from the source directory:

`swift test` runs tests  
`swift package generate-xcodeproj` creates an Xcode project


## Source

Inspired by 'Data Structures and Algorithms with Object-Oriented Design Patterns in Ruby', singly linked-lists. [https://web.archive.org/web/20160731005714/http://brpreiss.com/books/opus8/html/page96.html](https://web.archive.org/web/20160731005714/http://brpreiss.com/books/opus8/html/page96.html)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
