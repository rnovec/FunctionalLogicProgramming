
(* Programming Languages: Standard ML - 1 *)
fun length(x) = if null(x) then 0 else 1 + length(tl(x));
length([1,2,3,4]);

(* Programming Languages: Standard ML - 2 *)
fun append(x,z) = if null(x) then z else hd(x)::append(tl(x),z);
append([1,3],[2,4,5]);

fun reverse(x,z) = if null(x) then z else reverse(tl(x), hd(x)::z);
reverse([2,4,6,8,10],[]);

fun len([]) = 0 |   len(a::y) = 1+len(y);
len [2,4,6,8,10];