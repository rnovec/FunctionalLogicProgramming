fun even(x:int):int = if x=0 then 0 else even(x-2);

(* Finding integer square root *)
fun isqrt_0 (n : int) : int =
    let
        fun loop (i : int) : int =
            if n < i*i then i-1 else loop (i+1)
    in
        loop 1
    end;

fun f(0) = 1
| f(1) = 1
| f(n) = f(n-1) + f(n-2);