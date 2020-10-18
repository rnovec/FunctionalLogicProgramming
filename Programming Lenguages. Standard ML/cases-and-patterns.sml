(* Programming Languages: Standard ML - 3 *)
(* Cases and Patterns, alternative version of common functions *)

fun length([]) = 0 
    |  length(a::y) = 1+length(y);
length [2,4,6,8,10];

fun append(x,z) = if null(x) then z 
                else hd(x)::append(tl(x),z);

(* When not all cases are covered *)
fun head(a::y) = a;
(* stdIn:1.6-1.20 Warning: match nonexhaustive
          a :: y => ...
- val head = fn : 'a list -> 'a  *)
head [7];
(* val it = 7 : int *)
head [];
(* stdIn:3.1-3.8 Warning: type vars not generalized because of
   value restriction are instantiated to dummy types (X1,X2,...)
uncaught exception Match [nonexhaustive match failure]
  raised at: stdIn:1.20
*)

(* Patterns: Example *)
(* Implementation with a pattern *)
fun strip (a,[]) = []
|   strip (a,b::y) = if a=b then strip(a,y)
                    else b::y;
strip(1, [1,1,2,3,1,1]);

(* Another implementation: *)
fun strip(a, x) = if null(x) then nil
        else if a=hd(x) then strip(a, tl(x))
        else x;
strip(1, [1,1,2,3,1,1]);
