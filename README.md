# Programming Languages: Standard ML - 1

<iframe width="560" height="315" src="https://www.youtube.com/embed/videoseries?list=PLbdi8aNvDqlKKXdG7qn0rQsfH0z1hf7FC" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


## ML vs. Scheme

- Sintax in ML is more "conventional" (Scheme has **prefix** sintax)
  - 2+3\*4 vs. (+2 (\*3 4))
- ML:
  - Has **type declarations**
  - Uses **type inference**
    - (if **x** and **y** are _int_, then **x+y** is also _int_)
  - Is **strongly typed**
    - Type of every name and expression can be detemined at compile time
    - Scheme is in fact typeless
  - Has **exception handling** and a **module facility** to create ADTs

## Lists in ML

- A list is either:
  - Empty, i.e. [] ro _nil_
- Or of the form **a::y**
  - Where **a** is the head and **y** is the tail
- Example:
  - [7] es igual a 7::[]
- This sintax can be used to create lists and to extract their items

## Basics list operations

| Operation | Description                                                  |
| --------- | ------------------------------------------------------------ |
| _null(x)_ | true if x is an empty list                                   |
| _hd(x)_   | returns the head of x                                        |
| _tl(x)_   | returns the tail of x                                        |
| _a::x_    | constructs a list with head **a** and tail x (const in Lisp) |

```sml
hd([1,2,3]) = 1
tl([1,2,3]) = [2,3]
1::[2,3] = [1,2,3]
```
:next_track_button: [Programming Languages: Standard ML - 2](2-Recursion.md)
