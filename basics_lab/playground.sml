fun fst (x : int, y : int) : int = x;
fun snd (x : int, y : int) : int = y;
fun diag (x : int) : int * int = (x,x);
val tup = diag 37;
(((diag) (37))) 