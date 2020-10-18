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

map hd (x);


map tl (x);
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