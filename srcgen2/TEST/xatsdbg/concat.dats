(* ****** ****** *)
(*
Sun Apr 10 00:14:53 EDT 2022
*)
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS/CC/basics.dats"
(* ****** ****** *)

(*
fun
<
a:type
>
append
( xs: list(a)
, ys: list(a)): list(a) =
(
case+ xs of
|
list_nil() => ys
|
list_cons(x1, xs) =>
list_cons(x1, append(xs, ys))
)
*)
fun
<
a:type
>
append
( xs
: list(a)
, ys
: list(a)): list(a) =
(
  auxf(xs, ys) ) where
{
fun
auxf
( xs: list(a)
, ys: list(a)): list(a) =
(
case+ xs of
|
list_nil() => ys
|
list_cons(x1, xs) =>
list_cons(x1, auxf(xs, ys))
)
}

(* ****** ****** *)

(*
#extern
fun
<
a:type
>
append
( xs: list(a)
, ys: list(a)): list(a)

implement
<a:type>
append(xs, ys) =
(
  auxf(xs, ys)
) where
{
fun
auxf
( xs: list(a)
, ys: list(a)): list(a) =
(
case+ xs of
|
list_nil() => ys
|
list_cons(x1, xs) =>
list_cons(x1, auxf(xs, ys))
)
}
*)

(* ****** ****** *)

fun
<
a:type
>
concat
( xss
: list(list(a))): list(a) =
(
case+ xss of
|
list_nil
((*void*)) => list_nil()
|
list_cons
(xs1, xss) =>
append<a>(xs1, concat(xss))
)

(* ****** ****** *)

val xs =
list_nil()
val xs =
list_cons<int>(1, xs)
val xs =
list_cons(2, xs)

val xss = list_nil()
val xss = list_cons(xs, xss)
val xss = list_cons(xs, xss)

val flat = concat<int>( xss )

(* ****** ****** *)

val xs =
list_nil()
val xs =
list_cons<dflt>(1.1, xs)
val xs =
list_cons<dflt>(2.2, xs)

val xss = list_nil()
val xss = list_cons(xs, xss)
val xss = list_cons(xs, xss)

val flat = concat<dflt>( xss )

(* ****** ****** *)

(* end of [concat.dats] *)
