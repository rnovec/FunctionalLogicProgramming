
fun merge(nil, M) = M
| merge (L,nil) = L
| merge (x::xs,y::ys) = if x<y then x::merge(xs,y::ys)
                         else y::merge(x::xs, ys);

fun split(nil) = (nil,nil)
| split ([a]) = ([a],nil)
| split(a::b::rest) =
let  val(M,N) = split (rest)
in (a::M,b::N) end;

split ([1,2,3,4,5]);

split ([1,2,3,4,5]);
split([1,2,3,4,5,6,7,8,9,10]);
split(["a","b","c","d","e","r"]);
split([1,2,3,4,5,6,7,8,9,10,11]);
split([2,4,6,8,10]);