# Programming Languages: Standard ML - 4

```sml
fun map f [] = []
|   map f (a::y) = (f a)::(map f y);
```

- The _map_ function is **built-in**.
- It applies the fucntion **f** to every item in a list

- Example:
  - map succ [1,2,3] = [2,3,4]
  - map square [1,2,3] = [1,4,9]
  - map first [(1,"a"),(2,"b"),(3,"c")] = [1,2,3]
- How would you apply the **square** function to the **first** element of each pair in the list **[(1,"a"),(2,"b"),(3,"c")]**?

## map: Example

Let us asume that matrices are implemented as list of lists:

```sml
val x = [ [11,12,13,14],
[21,22,23,24],
[31,32,33,34] ];
```

- **hd x** returns the first row
- What of we want the first column?
- Answer: **map hd (x);**

### Nameless functions

- Nameless functions can be defined:
- fn \<formal-parameters> => body
- Example:
  - `fn z => x*2`
- Example:
  - `map (fn x => x*2) [1,2,3,4,5];`
    - `val it = [2,4,6,8,10]: int list`

### Selective copying

`remove_if`: removes items from a list if a condition evaluates to true

Example:

```sml
fun odd(x) = (x mod 2) = 1;
- val odd = fn: int -> bool

remove_if odd [0,1,2,3,4,5];
- val it = [0,2,4]: int list
```

```sml
fun remove_if f [] = []
|   remove_if f (a::y) =
        if f(a) then remove_if f y
        else a::(remove_if f y);

remove_if odd [0,1,2,3,4,5]
0::remove_if odd [1,2,3,4,5]
0::remove_if odd [2,3,4,5]
0::2::remove_if odd [3,4,5]
0::2::remove_if odd [4,5]
0::2::4::remove_if odd [5]
0::2::4::remove_if odd []
0::2::4:: []
0::2::[4]
0::[2,4]
[0,2,4]
```

### Implicit types

Ml is strongly typed

In many caes, types do not need to be specified of type inference

```sml
3*4;
- val it = 12: int

fun succ n = n + 1;
- val succ = fn : int->int
```

#### Typed tuples
- Product A * B (Tuple)
  - an ordered pair (a,b)
    - a is of type A, b is of type B
    - (1, "one")
  - Product A * B * C
    - An ordered 3-tuple

- Sometimes, types must be specified; especially when overloadings is used:
- `fun add(x,y) = x + y;`
  - Error: overloaded variable "+" cannot be resolved
  - Note: this actually works in SML because the default typoe is integer
  - `fun add(x,y): real = x + y;`
  - `- val add = fn : real*real->real`

### Polymorphism


```sml
fun l(x)=x;
- val l = fn : 'a -> 'a
```

type of l is a fucntion from any type to any type: $\infty$ to $\infty$

Example:
```sml
l(3);
l([1,2,3]);
l("john");
```

**length** is polymorphic since the argument can be a list of any type