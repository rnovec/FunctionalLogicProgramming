--Excepciones--


exception Nomatch;

fun member (a, []) = raise Nomatch
  | member(a, b::y) = if a = b then b::y
                      else member(a, y );

--para probar la excepcion--

member (3, [1,2,3,4,5,6]);
member (3, [1,2,2,4]);

--Handle--

fun member2(a, x) = member(a, x) handle Nomatch =>
		(print("No esta en la lista"); [] );

--Excepcion con Print--

fun member2(a, x) = member(a, x) handle Nomatch =>
                (print("No esta en la lista"); [] );

--Lo pruebas con:---

 member2(7, [1,2,3,4,5,6]);

--Funcion Print--

fun printList [] = ()
| printList( x::xt ) = (
  print(Int.toString( x ) );
  print("\n");
  printList(xt) );
	

--Lo pruebas con:--


printList([1,2,3,4]);