fun length [ ] = 0
| length (x::L) = 1 + length L;

fun sum [] = 0
| sum (x::L) = x + sum(L);

(*
sum [1,2,3]
= 1 + sum [2,3]
= 1 + (2 + sum [3])
= 1 + (2 + (3 + sum [ ]))
= 1 + (2 + (3 + 0))
= 6
*)

fun count [] = 0
| count (r::R) = (sum r) + (count R);

(*
count [[1,2,3], [1,2,3]]
⟹ * sum [1,2,3] + count [[1,2,3]]
⟹ * 6 + count [[1,2,3]]
⟹ * 6 + (sum [1,2,3] + count [ ])
⟹ * 6 + (6 + count [ ])
⟹ * 6 + (6 + 0)
⟹ * 6 + 6
⟹ * 12
*)

fun sum’ ([], a) = a
| sum’ (x::L, a) = sum’ (L, x+a);

fun parcount R = sum (map sum R);

(*
parcount [[1,2,3], [4,5], [6,7,8]]
⟹ * sum (map sum [[1,2,3], [4,5], [6,7,8]])
⟹ * sum [sum [1,2,3], sum [4,5], sum [6,7,8]]
⟹ * sum [6, 9, 21]
⟹ * 36
*)