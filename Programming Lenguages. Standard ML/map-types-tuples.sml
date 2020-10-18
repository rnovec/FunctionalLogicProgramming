(* Programming Languages: Standard ML - 4 *)
(* The map function is built-in *)
fun map f [] = [] 
|   map f (a::y) = (f a)::(map f y);

(* apply the square function to the first element of each pair in the list *)
fun succ(n) = n + 1;
fun square x = x * x;
fun first (x, y) = x;

map succ [1,2,3];
map square [1,2,3];
map first [(1,"a"),(2,"b"),(3,"c")];

map square (map first [(1,"a"),(2,"b"),(3,"c")]);

(* map: Example *)
val x = [   [11,12,13,14],
            [21,22,23,24],
            [31,32,33,34] ];
(* What if we want the first column? *)
map hd (x);
map tl (x);

(* Nameless functions *)
fn x => x*2;
map (fn x => x*2) [1,2,3,4,5];

(* Composition with map *)
fun mif(x) = 2 * x;
map mif [1,2,3,4,5,6];

fun compose(f, g) x = f(g(x));

fun otraf(x) = x * x;
fun mif(x)=2*x;
map mif [1,2,3,4,5];
fun milol (x)=x*x;
map milol [1,2,3,4,5];
fun compose (f,g) x = f(g(x));

compose (milol,mif)(2);
map (compose(mif,milol)) [1,2,3];

(* Selective copying *)
fun odd(x) = (x mod 2) = 1;
(* - val odd = fn: int -> bool *)

remove_if odd [0,1,2,3,4,5];
(* - val it = [0,2,4]: int list *)

fun remove_if f [] = []
|   remove_if f (a::y) = 
            if f(a)  then remove_if f y
            else a::(remove_if f y);

(* Typed tuples *)
fun sum x y = x+y;
sum 2 3;
fun add (x,y) = x+y;
add (2,3);
fun sub (x,y) = x-y;
sub (9,8);
sub (1,2);


fun add (x,y):real = x+y;
add (3.5,5.6);

(* Polymorphism *)
fun l(x)=x;
l(3);
l([1,2,3]);
l("john");