fun append (x,z) = 
    case x of [] => z |
    a::y => a::append(y, z);
(*usar la funcion*)
otroappend([1,2,3], [4,5]);

fun strip(a, []) = [] | strip(a, b::y) = if a = b then strip(a,y) else b::y;

strip(1, [2,3,4,5,6,5]);

fun strip(a, xs) = case xs of 
    [] => []
    | b::y => if a = b then strip(a, y) else b::y;

strip(1, [2,3,4,5,6,5]);

(*  *)
fun map f [] = [] | map f (a::y) = (f a)::(map f y);

fun mif(x) = 2 * x;
map mif [1,2,3,4,5,6];

fun compose(f, g) x = f(g(x));

fun otraf(x) = x * x;
fun mif(x)=2*x;
map mif [1,2,3,4,5];
val it = [2,4,6,8,10] : int list
fun milol (x)=x*x;
map milol [1,2,3,4,5];
fun compose (f,g) x = f(g(x));
- compose (mif,milol)(2);
val it = 8 : int
- compose (milol,mif)(2);
val it = 16 : int
- map (compose(mif,milol)) [1,2,3];
val it = [2,8,18] : int list


fun successor(n) = n+1;


fun square x =x*x;


fun first (x,y) = x;
first (1,"a");

fun first (x,y)=x;
map first [("a",1),("b",3)];


val x = [[ 11,12,13,14],
=       [21,22,23,24],
=       [31,32,33,34] ];

map hd (x);
map tl (x);
fn x => x*2;
map (fn x => x*2) [1,2,3,4,5];


