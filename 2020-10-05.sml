--Estructura con funcion mergeSort---

fun mergeSort [ ] = [ ]
 |  mergeSort [a] = [a]
 |  mergeSort theList =
       let
          val (x, y) = halve theList
       in
          merge(mergeSort x, mergeSort y)

       end;

--Para cualquier lista--

fun mergeSort [ ] = [ ]
 |  mergeSort [a] = [a]
 |  mergeSort theList =
       let
          (* here we can place the nested helper functions *)
	  fun halve [ ] = ([ ], [ ])
	   |  halve [a] = ([a], [ ])
	   |  halve (a::b::cs) =
	         let
	            val (x, y) = halve cs
	         in
	            (a::x, b::y)
	         end;
	  fun merge (nil, ys) = ys
	   |  merge (xs, nil) = xs
	   |  merge (x::xs, y::ys) =
	         if (x < y) then x :: merge(xs, y::ys)
	         else y :: merge(x::xs, ys);
	            val (x, y) = halve theList
	         in
	            merge(mergeSort x, mergeSort y)
	         end;
