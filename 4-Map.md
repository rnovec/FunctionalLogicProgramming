# Programming Languages: Standard ML - 4
```sml
fun map f [] = [] 
|   map f (a::y) = (f a)::(map f y);
```
- The *map* function is **built-in**.
- It applies the fucntion **f** to every item in a list

- Example:
    - map succ [1,2,3] = [2,3,4]
    - map square [1,2,3] = [1,4,9]
    - map first [(1,"a"),(2,"b"),(3,"c")] = [1,2,3]
- How would you apply the **square** function to the **first** element of each pair in the list **[(1,"a"),(2,"b"),(3,"c")]**?

## map: Example 
val x = [   [11,12,13,14],
            [21,22,23,24],
            [31,32,33,34] ];

map hd (x);