# Programming Languages: Standard ML - 5

<iframe width="560" height="315" src="https://www.youtube.com/embed/IDc7oJvpLBY" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Let
A let statement is available (as in Scheme):

let val new_name = expression
    in expressin2 end;

Examples:

```sml
let val pi = 3.14159 in pi*radius*radius end;

val radius = 1.0 ;
let val pi = 3.14159 in pi*radius*radius end;

fun hundredthPower(x: real) =
let
    val four = x*x*x*x
    val twenty = four*four*four*four*four
in 
    twenty*twenty*twenty*twenty*twenty 
end;
```

## Merge
- Lets write a function, **merge(L, M)**
    - L and M are sorted lists
    - marge returns a single sorted list with the elements of L and M

- Base case:
    - If L is empty, return M
    - If M is empty, return L
- Recursive step:
    - x = head(L), y=head(M)
    - If x < y return x, Merge(tail(L), M)
    - Else return y, Merge(L, tail(M))

```sml
fun merge(nil, M) = M
|   merge (L,nil) = L
|   merge (x::xt,y::yt) = 
            if x<y then x::merge(xt,y::yt)
            else y::merge(x::xt, yt);

merge([1,3,5], [2,4,6]);

x=1, xt=[3,5], y=2, yt=[4,6]
1::merge([3,5], [2,4,6])
1::2::merge([3,5], [4,6])
1::2::3::merge([5], [4,6])
1::2::3::4::merge([5], [6])
1::2::3::4::5::merge([], [6])
1::2::3::4::5::6:[]
[1,2,3,4,5,6]
```

## Split
Let us wirte a function, **split(L)**
- L is a list
- split splits L into two lists.
- One comntains elements 1,3,5,..,
- the other elements 2,4,6...

This function needs the **let** statement!

- Base case:
    - If L is empty, return two empty lists
    - If M is has a single element x, return [x] and an empty list
- Recursive step:
    - Let the first two elements be called a and b 
    - return the two lists (a::M, b::N)

```sml
fun split(nil) = (nil,nil)
|   split ([a]) = ([a],nil)
|   split(a::b::rest) =
    let  
        val(M,N) = split(rest)
    in 
        (a::M,b::N) 
    end;

split([1,2,3,4,5]);
a=1, b=2, rest=[3,4,5]
(M',N') = split([3,4,5]) in (1::M, 2::N)

split([3,4,5])
a=3, b=4, rest=[5]
(M',N') = split([5]) in (3::M, 4::N)

split([5]) = ([5],[]) = (M',N')
(3::[5], 4::[]) = ([3,5], [4]) = (M,N)
(1::M], 2::N) = (1::[3,5], 2::[4]) = ([1,3,5],[2,4])
```

## Merge Sort
- Let us wirte **mergeSort(L)**
- Base case:
    - If L is empty, or contains one element, then L is sorte and mergeSort return L
- Recursive step:
    - If L has two or more elements, then split the list into M and N by using split and recursively sort the two lists
    - Finally merge them by using the merge function

```sml
fun mergeSort(nil) = nil
|   mergeSort([a]) = [a]
|   mergeSort(L) =
    let
        val (M,N) = split(L)
    in
        merge(mergeSort(M), mergeSort(N)) 
    end;
    
mergeSort([3,6,5,7,2]);
M=[3,5,2]     N=[6,7]
merge(mergeSort([3,5,2]), mergeSort([6,7])) = [2,3,5,6,7]

    M=[3,2]     N=[5]
    merge(mergeSort([3,2]), mergeSort([5])) = [2,3,5]

        M=[3]     N=[2]
        merge(mergeSort([3]), mergeSort([2)) = [2,3]
```


:previous_track_button: [Programming Languages: Standard ML - 4](4-MapTypesAndTuples.md)
