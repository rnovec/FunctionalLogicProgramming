(* Programming Languages: Standard ML - 5 *)

val x = 2;
x;
fun addx y = x + y;
addx 3 ;
val x = 5;
addx 3 ;

(* LET *)
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

hundredthPower(1.2);
hundredthPower(1.0);
hundredthPower(0.9);


(* Merge function *)
fun merge(nil, M) = M
| merge (L,nil) = L
| merge (x::xt,y::yt) = if x<y then x::merge(xt,y::yt)
                         else y::merge(x::xt, yt);

merge([1,3,5], [2,4,6]);

(* Split function *)
fun split(nil) = (nil,nil)
|   split ([a]) = ([a],nil)
|   split(a::b::rest) = 
    let 
        val (M,N) = split(rest) 
    in  
        (a::M,b::N) 
    end;

split([1,2,3,4,5]);

(* mergeSort using merge & split functions *)
fun mergeSort(nil) = nil
|   mergeSort([a]) = [a]
|   mergeSort(L) =
    let
        val (M,N) = split(L)
    in
        merge(mergeSort(M), mergeSort(N)) 
    end;

mergeSort([3,6,5,7,2]);

(**)