# Introduction

While Swift has many different types, each of these types fall into one of two different classifications, _value types_ and _reference types_. In Swift, structs are value types while classes are reference types.

The primary difference between value types and reference types is that, when value types are assigned to a variable or constant, or when passed into a function, it is actually a copy of the value that is assigned or passed, not that particular value. Modifying one copy of a struct will not affect other copies. With reference types, a reference to that value is assigned or passed, so two different names can refer to the same instance of a class. This can lead to modification of the original instance when accessed under a different name.
