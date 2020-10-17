
(* 
    add3: int, int, int -> int
    REQUIRES: true
    ENSURES: add3 (x, y, z) -> Retorna la suma de x, y, z 
*) 
fun add3 (x:int, y:int, z:int) = x + y + z;
add3(1, 2, 3);


(* 
    flip: int, string -> string, int
    REQUIRES: true 
    ENSURES: flip (x, s) -> Retorna una tupla  (s, x) 
*)
fun flip ( x : int, s : string ) = (s, x);
flip(22, "Raul");

(* 
    diff: int, int -> int
    REQUIRES: true 
    ENSURES: diff (x, y) -> Devuelve la diferencia entre  y x.
*)
fun diff(x:int, y:int) =
    if (x < y)
    then (y - x)
    else (0);

diff(3, 4);
diff(4, 3);

(* 
    isZero: int -> bool
    REQUIRES: true 
    ENSURES: isZero x -> devuelve  true  si  x  es cero, de lo contrario  false.
*)
fun isZero x = if x = 0 then true else false;
isZero 0;
isZero 1;

(* 
    isZero: int -> bool
    REQUIRES: true 
    ENSURES: isZero x -> devuelve  true  si  x  es cero, de lo contrario  false.
*)
fun isZero x = x = 0;
isZero 0;
isZero 10;

(* 
    detectZeros: int,l int -> bool
    REQUIRES: true 
    ENSURES: detectZeros (x, y) -> Evalúa como  true  si  x es cero o  y  es cero
*)
fun detectZeros (x:int, y:int) = x = 0 orelse y = 0;

detectZeros(1,0);