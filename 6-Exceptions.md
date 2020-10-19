# Programming Languages: Standard ML - 6

<iframe width="560" height="315" src="https://www.youtube.com/embed/CNHZI-YRvfw" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Exception Handling

- ML has an exception mechanism
- An exception is defined like this:
    - `exception Nomatch;`
    - `raise <exception_name>`
- Lets write the function member in the following manner:
    - **member** looks for an element **a** in list **x**, raises an exception if the list is empty, but else returns the portion of the list from the first ocurrence of **a**

```sml
exception Nomatch;

fun member (a, []) = raise Nomatch
|   member(a, b::y) = if a = b then b::y
                      else member(a, y);
member (3, [1,2,3,4]);
- val it = [3,4] : int list

member (3, [1,2,2,4]);
- uncaught exception Nomatch
```

- Exceptions are handled like this:
    - \<expression><sub>1</sub> handle \<exception_name> => \<expression><sub>2</sub>

If \<exception_name> is raised when computing \<expression><sub>1</sub> then control is transfered to \<expression><sub>2</sub>

```sml
exception Nomatch;

fun member (a, []) = raise Nomatch
|   member(a, b::y) = if a = b then b::y
                      else member(a, y);

fun member2(a, x) = member(a, x) handle 
    Nomatch =>
	(print("No esta en la lista"); [] 
    );
```

## Type Unit
- Unit is a basic type in ML
    - Similar to C/C++
    - Unit has one value: ()
- 