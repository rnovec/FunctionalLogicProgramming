-- Composicion de funciones--

- fun comp(F, G, x) = G(F(x));
val comp = fn : ('a -> 'b) * ('b -> 'c) * 'a -> 'c
- comp( fn x => x+3, fn y => y*y +2*y, 4);
val it = 63 : int

--Ejemplo2--

- fun F x = x+3;
val F = fn : int -> int
- fun G y = y*y + 2*y;
val G = fn : int -> int
- val H = G o F;
val H = fn : int -> int
- H 4;
val it = 63 : int

-- funcion rev--

rev [lista];

--funcion explode--

- explode "lol";
val it = [#"l",#"o",#"l"] : char list

--Funcion map con hd, rev y explode--

map(hd o rev o explode)["siggi","joi","palli","gummi"];

val it = [#"i",#"i",#"i",#"i"] : char list

--funcion composicion con "Let"--

- fun com2 F G =
=     let
=       fun C x = G(F(x))
=     in
=       C
=     end;
val com2 = fn : ('a -> 'b) -> ('b -> 'c) -> 'a -> 'c