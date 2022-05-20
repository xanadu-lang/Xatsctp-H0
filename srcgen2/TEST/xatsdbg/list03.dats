(* ****** ****** *)
(*
Sat Apr  9 13:53:20 EDT 2022
*)
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS/CC/basics.dats"
(* ****** ****** *)
#extern
fun
<a:type>
mylen2(xs: a): int
(* ****** ****** *)
//
impltmp
{a:type}
mylen2
<list(a)>
( xs ) = auxf(xs) where
{
fun
auxf(xs: list(a)): int =
case+ xs of
|
list_nil() => 0
|
list_cons(x1, xs) => 1+auxf(xs)
}
//
(* ****** ****** *)

val xs =
list_nil()
val xs =
list_cons(1, xs)
val xs =
list_cons(2, xs)

val l0 = mylen2<list(int)>(xs)

(* ****** ****** *)

(* end of [list03.dats] *)
