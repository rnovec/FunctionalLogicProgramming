# Programming Languages: Standard ML - 3

<iframe width="560" height="315" src="https://www.youtube.com/embed/m8NBB0HH2xM" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Cases and Patterns

- List functions usually have two cases: **base case** for the empty list, and a **recursive step** for a non-empty list.
- Example is length of list:
  - ```sml
      length([]) = 0
      length(a::y) = 1 length(y)
    ```
- ML allows us write it like this:

  - ```sml
      fun length([]) = 0
      |   length(a::y) = 1 + length(y);
    ```

- No need for null, hd & tl

We can write:

```sml
fun append([],z) = z
|   append(a::y,z) = a::append(y,z);
```

instead of:

```sml
fun append(x,z) = if null(x) then z
                else hd(x)::append(tl(x),z);
```

### Patterns

- Functions that take **more than one** argument can be declared like:
  - fun \<name> \<pattern> = \<body>
    - \<pattern> is and expression, consisting of variables, constants, pairs and constructors
    - An example \<pattern>: [], a::y, (x,y)
    - `fun first(x,y) = x`
    - `fun first(x,_) = x`

fun f \<pattern<sub>1</sub>> = \<expression<sub>1</sub>><br>
| f \<pattern<sub>2</sub>> = \<expression<sub>2</sub>><br>
...<br>
| f \<pattern<sub>n</sub>> = \<expression<sub>n</sub>><br>

```sml
fun length([]) = 0
|   length(a::y) = 1 + length(y);
```

#### When not all cases are covered

```sml
fun head(a::y) = a;
stdIn:1.6-1.20 Warning: match nonexhaustive
          a :: y => ...
- val head = fn : 'a list -> 'a
head [7];
- val it = 7 : int
head [];
stdIn:3.1-3.8 Warning: type vars not generalized because of
   value restriction are instantiated to dummy types (X1,X2,...)


uncaught exception Match [nonexhaustive match failure]
  raised at: stdIn:1.20
```

#### Patterns: Example

strip(1, [1,1,2,3,1,1]) = [2,3,1,1]
Implementation with a pattern

```sml
fun strip (a,[]) = []
|   strip (a,b::y) = if a=b then strip(a,y)
                    else b::y;
```

- Another implementation:

```sml
fun strip(a, x) = if null(x) then nil
        else if a=hd(x) then strip(a, tl(x))
        else x;
```

- Analysis

```sml
strip(1, [1,1,2,3,1,1])
strip(1, [1,2,3,1,1])
strip(1, [2,3,1,1])
[2,3,1,1]
```

:next_track_button: [Programming Languages: Standard ML - 4](4-MapTypesAndTuples.md)
