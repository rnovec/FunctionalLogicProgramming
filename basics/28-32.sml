(* 28-32 *)
fun decimal (n: int): int list = if n < 10 then [n] else (n mod 10) :: decimal(n div 10);

(* 33 *)
fun squareit (a: real) : real = a * a;
fun squareit (b: real) : int = trunc b * trunc b;
fun bopit (c: real) : real = squareit(c + 1.0);

(* 34 *)
val x : int = 3;
fun foo (w: int, x: int) : int = 2 + x;
val y : int = x;
val x : int = 4;
val z : int = foo(y, x);