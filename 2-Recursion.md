# Programming Languages: Standard ML - 2

https://www.youtube.com/embed/JTgYxByRDC4


## NOTAS RAPIDAS DEL PRIMER VIDEO

f g x = (f ° g)(x) // Notación matemática NO la acepta el REPL de SML

### EJEMPLO:

f(x) = 2 \*x
g(x) = x^2

(f ° g)(2) = 8 ??

(g ° f)(2) = 16 ¡¡

// ASI SE HARIA EN EL REPL DE SML
f (g 2) = ?? 8

g (f 2) = ?? 16

## Functions in ML

- Defined using this sintax
  - fun \<name> \<formal-parameters> = \<body>
- Example: fun succ n = n + 1;
- You call the function like this:
  - f(x) or f x
- Expressions **f g x** is the same as **(f g) x**
  - i.e. function call are **left-associative**

### Ejemplo de evaluación recursiva de length

This function is linearly recursive because f calls itself only once on the right hand side

```sml
fun length(x) = if null(x) then 0 else 1 + length(tl(x));

length([1,2,3,4])
1 + length([2,3,4])
1 + 1 + length([3, 4])
1 + 1 + 1 + length([4])
1 + 1 + 1 + 1 + length([])
1 + 1 + 1 + 1 + 0
= 4
```

## Common list operations

### Recursion

- Recursive functions always consist of a **base case** and **recursive step**

#### Example: Append

- append(x, z)
  - rturns a new list with elements of x followed by elements of z
  - append([1,2], [3,4,5]) = [1,2] @ [3,4,5] = [1,2,3,4,5]
  - ML has a **built-in** append operation _@_
- This is always true:
  - append([], z) = z
  - append(a:.y, z) = z a::append(y,z)
- In ML:

```sml
fun append(x,z) = if null(x) then z
                else hd(x)::append(tl(x),z);

1::append([2], [3,4,5])
1::2::append([], [3,4,5])
1::2::[3,4,5]
1::[2,3,4,5]
[1,2,3,4,5]
```

How long does it take for append to process a list (first argument) of length n?

#### Example: Reverse

- reverse(x,z)
  - reverse x and prepend to z
  - reverse([2,3,4], [1] = [4, 3, 2, 1]
- The following holds:
  - reverse([], z) = z
  - reverse(a::y, z) = reverse(y, a::z)
  - ML has a **built-in** function _rev_
    - rev(x) = reverse(x, [])

```sml
fun reverse(x,z) = if null(x) then z
                else reverse(tl(x), hd(x)::z);

reverse([2,3,4], [1]) =
reverse([3,4], 2::[1]) = reverse([3,4], [2, 1]) =
reverse([4], 3::[2, 1]) = reverse([4], [3, 2, 1]) =
reverse([], 4::[3, 2, 1]) = reverse([], [4, 3, 2, 1]) =
[4, 3, 2, 1]
```

Reverse is **O(n)** where **n** is lenght of **x**

#### A diferent implementation of reverse

Why not write it like this?

- fun reverse(x) = if null (x) then nil else reverse(tl(x)) @ [hd(x)];
- Lets assume we send in a list L of Lenght n
  - append is O(n)
  - reverse is executed n times
  - => **this version of reverse is O(n<sup>2</sup>)**

```sml
reverse [1,2,3,4]
reverse [2,3,4]  @ [1]
reverse [3,4] @ [2] @ [1]
reverse [4] @ [3] @ [2] @ [1]
reverse [] @ [4] @ [3] @ [2] @ [1]
```

:next_track_button: [Programming Languages: Standard ML - 3](3-CasesAndPatterns.md)
