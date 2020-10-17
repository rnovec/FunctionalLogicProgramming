exception Nomatch;

fun member(a, []) = raise Nomatch 
| member(a, b::y) = if a = b then b::y else member(a, y);

fun member2(a, x) = member(a, x) handle Nomatch => 
        (print("Empty list! "); []);

member2(7, [1,2,3,4,5,6]);

fun printList [] = () | printList(x::xt) = (
    print(Int.toString(x));
    print("\n");
    printList(xt)
);
printList [1,2,3,4,5];