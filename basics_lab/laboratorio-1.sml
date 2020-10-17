
(* PARTE DE WIKI VA AQUI *)
1.- Las expresiones son la unidad básica de un programa SML.

(Ejercicio 1)
//ejemplos 1.//
 -fun factorial 0 = 1
   | factorial n = n * factorial (n - 1);

//ejemplo 2.//

- fun factorialIT value =
let
  val flag = ref value and i = ref 1
in
  while !flag <> 0 do (
  i := !i * !flag;
  flag := !flag - 1
  );
  !i
end;
//ML estándar proporciona un fuerte apoyo para los tipos de datos algebraicos . 
Un tipo de datos ML puede ser pensado como una unión disjunta de tuplas (o una "suma de productos"). 
Son fáciles de definir y fácil de programar con, en gran parte debido a la del ml estándar de coincidencia de patrones , 
así como la comprobación de patrón de exhaustividad mayoría de las implementaciones estándar ml y la comprobación de redundancia patrón.
Un tipo de datos se define con el tipo de datos de palabras clave, como en//

//ejemplo 3://

 datatype shape
    = Circle   of loc * real      (* center and radius *)
    | Square   of loc * real      (* upper-left corner and side length; axis-aligned *)
    | Triangle of loc * loc * loc (* corners *)

(Ejercicio 2)
Un tipo de programa comprueba si no tiene errores de tipo; los errores de tipo proceden de expresiones que no están bien tipadas. Si tenemos:
e : t
Decimos que la expresión e tiene el tipo  t.
Ejemplo(s):

//La regla más fundamental para la verificación de tipos es durante la aplicación de la función, o el acto de aplicar una función a sus argumentos. 
Esto se explica más detalladamente en el capítulo sobre funciones.Una expresión e1 e2 tiene tipo t2 si y solo si e1: t1 -> t2 y e2: t1.
Más específicamente, para una función f: t1 -> t2, si x: t3 donde t3 no es del mismo tipo que t1, 
entonces la expresión f x está mal escrita. En palabras, dar a una función un argumento que no es del tipo correspondiente a su 
tipo de entrada está mal escrito y hará que un programa se rechace en tiempo de compilación. Llamamos a una expresión que 
no encuentra un error de tipo bien escrito. La mayoría de los errores de tipo se producirán como consecuencia de esta regla. 
Dado que las funciones tienen tipos de retorno definidos, es muy simple verificar si un programa verifica el tipo; 
simplemente evalúe los tipos de las expresiones y vea si se alcanza un error de tipo. La fase de verificación de tipo es independiente 
de los valores específicos de las expresiones: cuando se le da una expresión como 1 + 2, simplemente ve dos expresiones de tipo int que 
se pasan a una función de tipo int * int -> int, y por lo tanto sabe que el resultado debe ser de tipo int y que toda la expresión esté bien 
escrita.//

//ejemplos://

//ejemplo 1.//
- fun int x = 2;
val int = fn : 'a -> int
- int 2*int 2;
val it = 4 : int

//ejemplo 2.//

- fun lol x =0;
val lol = fn : 'a -> int
- int 3 / lol 0;
stdIn:158.1-158.14 Error: operator and operand do not agree [tycon mismatch]
  operator domain: real * real
  operand:         int * int
  in expression:
    int 3 / lol 0

/*También hay tipos de función. Un tipo de función se puede reconocer mediante una flecha en él, como:
e : t1 -> t2*/


//Más específicamente, para una función f: t1 -> t2, si x: t3 donde t3 no es del mismo tipo que t1, entonces la expresión f x está mal escrita. 
En palabras, dar a una función un argumento que no es del tipo correspondiente a su tipo de entrada está mal escrito y 
hará que un programa se rechace en tiempo de compilación. Llamamos a una expresión que no encuentra un error de tipo bien escrito.//
//ejemplo1//
- e2:t1 -> t2
= e2 : t1
//ejemplo2//
= e3: t3->t4
= e3:t3

//ejemplo3//
- val e3;
- val e4;

(Ejercicio 3)
//Podemos enlazar valores a nombres de variables (también llamados identificadores)utilizando la sintaxis:
val <var> : <tipo> ?<expr>
Para que esto escriba la comprobación, la expresión <expr>  debe tener el tipo  <tipo>.
Ejemplo(s)://

//ejemplo 1//
= val <var>: <int> = <6>
//ejemplo2//
= val <var>: <String> = <Hello>
(Ejercicio 4)
Las funciones de SML se pueden definir (o declarar)mediante la palabra clave fun.  keyword.
Ejemplo(s):

//Ejemplo 1//
 fun heron (a, b, c) = let
      val ab = dist (a, b)
      val bc = dist (b, c)
      val ac = dist (a, c)
      val perim = ab + bc + ac
      val s = perim / 2.0
      in
        Math.sqrt (s * (s - ab) * (s - bc) * (s - ac))
      end
//ejemplo 2//
fun center (Circle (c, _)) = c
    | center (Square ((x, y), s)) = (x + s / 2.0, y + s / 2.0)

(ejercicio 5)  
//Las declaraciones tienen un atributo denominado scope, que está en todas partes donde se puede usar. 
Cuando se realiza una nueva declaración, esa declaración solo tiene acceso a los enlaces de nombre de variable creados  antes  de ella. 
Una declaración no se puede realizar a partir de enlaces creados  después de  ella; no está en el ámbito de dichos enlaces.
Usamos notación de enlace de entorno para ayudarnos a realizar un seguimiento de los enlaces. 
Tenga en cuenta que esta no es la sintaxis SML real. Anote lo siguiente con notación de enlace de entorno:
Por ende tenemos que:
Val	X:	Int	10	
Val	y :	Int	=	x * x
Val	Z:	Int	=	x + y//

Rescribiendo:


= val <x> = <int> =<10>
= val <y> = <int> = <x*x>
= val <z> = <int> = <x+y>

 (ejercicio 6)
 El enlace a nombres de variables en SML es diferente de la asignación en otros lenguajes de programación. 
 Si se enlaza a la misma variable dos veces, la variable sigue enlazando el primer valor entre el primer y el segundo enlace; 
 decimos que la segunda unión sombrea  el primer enlace en lugar de reemplazarlo en todas partes, porque antes de la segunda unión el 
 primer enlace todavía existe!

 Solucion://
Al igual que en cualquier otro lenguaje de programación, se pueden asignar valores a variables que se pueden usar en 
una expresión para representar ese valor. Sin embargo, en marcado contraste con los lenguajes más familiares, las variables en 
SML no varían (!). Los valores están vinculados a variables mediante vinculaciones de valor; 
una vez que una variable está vinculada a un valor, está vinculada de por vida. No hay posibilidad de cambiar la vinculación de una 
variable después de que se haya vinculado. En este sentido, las variables en SML son más parecidas a las variables en matemáticas que a 
las variables en lenguajes como C. De manera similar, los tipos pueden estar vinculados a las variables de tipo utilizando enlaces de tipo; 
la variable de tipo así definida representa el tipo vinculado a ella y nunca puede representar ningún otro tipo.
El primer enlace introduce la variable m, especificando su tipo como int y su valor como 5. El segundo introduce dos variables, 
pi y e, simultáneamente, ambas con tipo real y pi con valor 3,14 ye que tiene valor 2,17. Observe que un enlace de valor especifica 
tanto el tipo como el valor de una variable. La sintaxis de las asociaciones de valores es val var1: typ1 = exp1 y ... y varn: typn = expn, 
donde cada vari es una variable, cada typi es una expresión de tipo y cada expi es una expresión. Como sin duda habrá supuesto, 
las vinculaciones de valores se verifican comparando el tipo del lado derecho con el tipo especificado para asegurarse de que coinciden. 
Si se produce una discrepancia, la vinculación de valores se rechaza por estar mal formada. Las vinculaciones bien tipificadas se evalúan 
de acuerdo con la regla de vinculación por valor: se evalúa el lado derecho de la vinculación y el valor resultante (si lo hay) se vincula a 
la variable dada. El propósito de un enlace es hacer que una variable esté disponible para su uso dentro de su alcance. 
En el caso de un enlace de tipo, podemos usar la variable de tipo introducida por ese enlace en las expresiones de tipo que ocurren 
dentro de su alcance. Por ejemplo, en presencia de los enlaces de tipo anteriores, podemos escribir val pi: flotar = 3,14 dado que la 
variable de tipo float está ligada al tipo real, el tipo de la expresión 3.14. De manera similar, podemos hacer uso de la variable 
introducida por un enlace de valor en expresiones de valor que ocurren dentro de su alcance. Continuando con el enlace anterior, podemos 
usar la expresión pecado pi para representar 0.0 (aproximadamente), y podemos vincular este valor a una variable escribiendo
ejemplo1.
val x: float = sin pi

Como ilustran estos ejemplos, la verificación y evaluación de tipos dependen del contexto en presencia de enlaces de tipo y valor, ya
 que debemos referirnos a estos enlaces para determinar los tipos y valores de las expresiones. Por ejemplo, para determinar que el 
 enlace anterior para x está bien formado, debemos consultar el enlace para pi para determinar que tiene un tipo float, consultar el enlace
  para float para determinar que es sinónimo de real, que es necesario para el enlace de x para tener tipo flo
Ejemplo 2.
= val m : int = 3+2
= val n : int = m*m
=
= val n : real = 2.17
=
= let
=     val m:int = 3
=     val n:int = m*m
= in
=     m*n
= end
=
= val m:int = 2
= val r:int =
=     let
= val m:int=3
= val n:int=m*m
=     in
= m*n
=     end * m
=
= val m : int = 0
= val x : real = sqrt(2)
= val c : char = #"a"

(* INICIA PARTE DE RAUL 7-12 *)
(*
Ejercicio 7
*)

"Hello, world!"

(*
Tarea 1 (Ejercicio 8)
Tipo
*)
2 + 2;

(*
Tarea 2 (Ejercicio 9)
Tipo
*)
2 + 2
;

(*
Tarea 3 (Ejercicio 10)
Tipo
*)
1 + 2 * 3 + 4;

en el REPL. ¿Cuál esperaría que sea el resultado? 11 ¿Cuál es el resultado real? 21

(1 + 2) * (3 + 4);

en el REPL. ¿El resultado es el mismo? NO ¿Por qué  o  por qué  no?? Por la precedencia de los parentesis


(*
Tarea 4 (Ejercicio 11)
Escriba "foo"; en el REPL. ¿Cuál es el resultado? val it = "foo" : string
*)
"foo"

(*
Tarea 5 (Ejercicio 12)
Tipo
*)
"foo" ^ " bar";

en el REPL. ¿Cuál es el resultado?  val it = "foo bar" : string

(* TERMINA PARTE DE RAUL 7-12 *)


(* PARTE DE BRITO VA AQUI *)

(* Tarea 6 Ejercicio 13 *)

(* Sucede un error donde se señala que el operador no es una función.
Esto se debe a que se trata de interpretar 3 como si fuera una función con argumento x, lo cual no es posible *)

(* Tarea 7 Ejercicio 14 *)

(* El resultado es que la variable "it" cambia a 20 *)

(* Tarea 8 Ejercicio 15 *)

(* El resultado es que definimos x con el total de 2 + 2. Difiere de un simple "2 + 2" ya que ahora estamos aginando el resultado a una variable definida, no a una variable default como lo es "it" *)

(* Tarea 9 Ejercicio 16 *)

(* El resultado es que a variable "it" se inicializa con el valor de x*)

(* Tarea 10 Ejercicio 17 *)

(* Ahora se ve que la variable "y" se inicializa con el valor de "x * x"*)

(* Tarea 11 Ejercicio 18 *)

(* Ocurre un error debido a que no es posible convertir a string el resultado numérico de x * x*)

(* PARTE DE BRITO TERMIAN AQUÍ *)

(* PARTE DE PAUL VA AQUI *)

(* Tarea 12 - despues de lo anterior escriba "  z*z; " *)

 (* |z * z;| da un error porque no estan asignados recordemos asignar con val <name> = <value>*)

(* Tarea 13 *)

(* Escribe y menciona cuales son los valores*)

val x : int = 3;
val x : int = 10;
val x : string = "hello, world";

(*respuesta:
    int, int y string
*)

(*dato: podemos declarar diferentes tipos de datos en una sola linea mediante tuplas, ej.*)
val (x : int, y : int) = (3, 4);

(*Dato: esto asigna a Z una tupla (3, 4) *)
val z : int * int = (3, 4);


(* 6.2 - Aplicación de funciones 
    En este archivo, observe que hay funciones definidas. Por ejemplo, hay:
*)

fun fst (x : int, y : int) : int = x;
fun snd (x : int, y : int) : int = y;
fun diag (x : int) : int * int = (x,x);
val tup = diag 37;
(((diag) (37))) 


(* Tarea 14 -

¿Cuál es el tipo de fst, y qué hace?
R: es de tipo int y recibe 2 parametros, x y, retorna x

*)



(* Tarea 15 -  

¿Cuál es el tipo de snd, y qué hace?
R: es de tipo int y recibe 2 parametros, x y, retorna y

*)

(* Tarea 16 -  

¿Cuál es el tipo de diag, y qué hace?
R: es de tipo int y recibe 1 parametro, x , retorna una tupla de x que seria: (x, x)

*)

(* PARTE DE PAUL TERMINA AQUI *)

(* INICIA PARTE DE ADOLFO 24-28 *)
(*
Tarea 17 (Ejercicio 24)
Una función denominada add3  que toma un triple  (x,y,z)  de tres enteros y devuelve su suma  x  +  y  +  z.

*)

(* 
    add3: int * int * int -> int
    REQUIRES: true * 
    ENSURES: add3 (x, y, z) == > Suma de los 3 valores 
*) 
fun add3 (x:int, y:int, z:int) = x + y + z;
add3(2, 3, 6);

(*
Tarea 18. (Ejercicio 25)
Una función denominada flip  que toma una tupla  (x,s)  donde  x es un entero y  s es una cadena, y devuelve la tupla  (s,x).

*)

(* 
    flip: int * string -> string * int
    REQUIRES: true * 
    ENSURES: flip (x, s) ==> Devuelve la tupla  (s, x) 
*)
fun flip ( x : int, s : string ) = (s, x);
val (s, x) = flip(5, "SML");

(*
Tarea 19. (Ejercicio 26)
Una función denominada diff que toma una tupla  (x,y) de enteros donde x < y y devuelve su diferencia  yx.

*)

(* 
    diff: int * int -> int
    REQUIRES: true * 
    ENSURES: diff (x, y) ==> Devuelve la diferencia de los valores
*)
fun diff(x:int, y:int) =
    if (x < y)
    then (y - x)
    else (0);

diff(6, 10);

(*
Tarea 20 (Ejercicio 27)
Una función denominada isZero  que toma un entero  x  y devuelve  true  si  x  es cero, de lo contrario  false.
*)

(* 
    isZero: int -> bool
    REQUIRES: true * 
    ENSURES: isZero x ==> Identifica si el valor es cero o no
*)
fun isZero x = if x = 0 then true else false;
isZero 0;
isZero 2;
fun isZero 0 = true | isZero x = false;
isZero 8;
isZero 0;
fun isZero x = x = 0;
isZero 0;
isZero 5;
(*
Tarea 21. (Ejercicio 28)
Una función denominada detectZeros  que toma una tupla  (x,y)  y se evalúa como  true  si  x es cero o  y  es cero.
Sugerencia: Es posible que el operador de infijo integrado  os menos sea  útil. Estos son algunos ejemplos de cómo se utiliza orelse:  is used:
*)

(* 
    detectZeros: int * int -> bool
    REQUIRES: true * 
    ENSURES: detectZeros (x, y) ==> Identifica si algun valor es cero o no
*)
fun detectZeros (x:int, y:int) = x = 0 orelse y = 0;

fun detectZeros (x:int, y:int) = 
    if x = 0 orelse y = 0
    then true
    else false;

detectZeros(6,0);