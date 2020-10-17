
(* Programming Languages: Standard ML - 2 *)
fun length(x) = if null(x) then 0 else 1 + length(tl(x));
length([1,2,3,4]);

[1,2] @ [3,4,5]; (* SML Built-in append *)
fun append(x,z) = if null(x) then z else hd(x)::append(tl(x),z);
append([1,3],[2,4,5]);

rev([3,4,5]); (* SML Built-in reverse *)
fun reverse(x,z) = if null(x) then z else reverse(tl(x), hd(x)::z);
reverse([2,4,6,8,10],[]);

(* A diferent implementation of reverse - it takes O(n^2) times *)
fun reverse(x) = if null (x) then nil else reverse(tl(x)) @ [hd(x)];
reverse([1,2,3,4,5,6,7,8]);

fun len([]) = 0 |   len(a::y) = 1+len(y);
len [2,4,6,8,10];