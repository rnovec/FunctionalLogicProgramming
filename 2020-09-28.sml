
--remueve numeros pares--


- fun remove_if f [] = []
=       | remove_if f (a::y) = if f(a)  then remove_if f y
=                       else a::(remove_if f y) ;
val remove_if = fn : ('a -> bool) -> 'a list -> 'a list
- remove_if (fn x=> x mod 2 = 0) [2,4,6,1,3,5,2,6,8];
val it = [1,3,5] : int list


--funcion  strip eleimina elementos sujetos a una condicion--

- fun strip (a,[]) = []
= |   strip (a,b::y) =
=        if a=b
=        then strip(a,y)
=        else b::strip(a,y);
val strip = fn : ''a * ''a list -> ''a list
- strip(3,[1,2,3,4,3,2,1]);
val it = [1,2,4,2,1] : int list
- strip(5,[1,2,3,4,3,2,1]);
val it = [1,2,3,4,3,2,1] : int list
- strip("dog",["cat","dog","fish","dog","book"]);
val it = ["cat","fish","book"] : string list
- strip([1,2],[[3,4],[2,3],[1,2],[1,3]]);
val it = [[3,4],[2,3],[1,3]] : int list list


--funcion producto--


-- funciones con tupla, Suma y resta   ---

- fun suma x y = x+y ;
val suma = fn : int -> int -> int
- suma 2 3;
val it = 5 : int
- fun add (x,y) = x+y;
val add = fn : int * int -> int
- add (2,3);
val it = 5 : int
- fun restar (x,y) = x-y;
val restar = fn : int * int -> int
- restar (9,8);
val it = 1 : int
- restar (1,2);
val it = ~1 : int


--funciones con reales---

- fun add (x,y):real = x+y;
val add = fn : real * real -> real
- add (3.5,5.6);
val it = 9.1 : real


--funcion identidad---

- fun l(x)=x;
val l = fn : 'a -> 'a
- fun l(x)=x;
val l = fn : 'a -> 'a
- l(3);
val it = 3 : int
- l([1,2,3]);
val it = [1,2,3] : int list
- l("jon");
val it = "jon" : string

--funcion reciproca con identidad--

- fun reci(x):real = 1.0/x;
val reci = fn : real -> real
- reci 5.0;
val it = 0.2 : real
- fun I x = x;
val I = fn : 'a -> 'a
- (I o I ) 2.0;
val it = 2.0 : real
-






