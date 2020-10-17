(* NOTAS RAPIDAS DURANTE LA CLASE *)

- val x = 2;
- x;
- fun addx y = x + y;
- addx 3 ;
- val x = 5;
- addx 3 ;
- let val pi = 3.14159 in pi*radius*radius end ;
stdIn:8.36-8.42 Error: unbound variable or constructor: radius
stdIn:8.29-8.35 Error: unbound variable or constructor: radius

- val radius = 1.0 ;
- let val pi = 3.14159 in pi*radius*radius end ;
val it = 3.14159 : real
- fun cienPotencia(x: real) =
= let
= val cuatro = x*x*x*x
= val veinte = cuatro*cuatro*cuatro*cuatro*cuatro
= in veinte*veinte*veinte*veinte*veinte end ;
- cienPotencia(1.2);
- cienPotencia(1.0) ;
val it = 1.0 : real
- cienPotencia(0.9) ;
- fun merge( nil, M) = M
= | merge( L, nil) = L
= | merge(x:xs, y:ys ) = if hd(x:xs) < hd(y:ys) x::merge(tail(L),M)
= else y::merge(L,tail(M)) ;
stdIn:21.26-21.32 Error: syntax error: deleting ELSE IDA

- fun merge( nil, M) = M
= | merge( L, nil) = L
= | merge(x::xs, y::ys ) = if x < y then x::merge(xs,y::ys)
= else y::merge(x::xs, ys) ;


- merge([1,3,5], [2,4,6]) ;
- fun split(nil) = (nil, nil)
= | split([a]) = ([a], nil)
= | split(a::b::rest) =
= let val (N, M) = split( rest )
=
=
= in (a::M, b::N) end ;
- split([1,2,3,4,5]);
val it = ([1,4,5],[2,3]) : int list * int list

(* SESION DE LA TARDE *)
- val x =2 ;
val x = 2 : int
- fun addx y = x + y ;
- addx 3 ;
val it = 5 : int
- val x = 5 ;
val x = 5 : int
- addx 3 ;
val it = 5 : int
- val x = 20 ;
val x = 20 : int
- addx 3 ;
val it = 5 : int
- fun merge(nil, M) = M
= | merge( L, nil) = L
= | merge(x:xt, y::yt ) =
= if x < y then x::merge(xt, y::yt )
= else y::merge( x::xt, yt );
stdIn:10.13-10.15 Error: unbound type constructor: xt

stdIn:11.29-11.31 Error: unbound variable or constructor: xt

stdIn:12.24-12.26 Error: unbound variable or constructor: xt

- fun merge(nil, M) = M
= | merge( L, nil) = L
= | merge(x::xt, y::yt ) =
= if x < y then x::merge(xt, y::yt )
= else y::merge( x::xt, yt );
- merge([1,3,5], [2,4,6] ) ;
val it = [1,2,3,4,5,6] : int list
- fun split(nil) = (nil, nil)
= | split([a]) = ([a], nil)
= | split(a::b::rest) =
= let
= val (M, N) = split( rest )
= in
= (a::M, b::N)
= end ;
fun mergeSort( nil ) = nil
= | mergeSort( [a] ) = [a]
= | mergeSort( L ) =
= let
= val (M,N) = split( L )
= in
= merge( mergeSort(M), mergeSort(N) ) end ;
- mergeSort([3,6,5, 7, 2] );