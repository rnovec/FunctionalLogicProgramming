 fun otro( x, z) = case x of [] => z
               | a::y => otro(y, z);


fun strip(a, xs)= case xs of [] => []
              | b::y => if a = b then strip( a, y) else b::y 


fun strip (a,[]) = []
|   strip (a,b::y) =
       if a=b
       then strip(a,y)
       else b::strip(a,y);

fun strip(a, x) = if null(x) then nil
              else if a=hd(x) then strip (a, tl(x))
              else x;












