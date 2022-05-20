(* ****** ****** *)
(*
Thu May 19 20:10:28 EDT 2022
*)
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS/CC/basics.dats"
(* ****** ****** *)

fun
<a:type>
<b:type>
swap
( xy
: $(a, b)
)
: $(b, a) = $(xy.1, xy.0)

(* ****** ****** *)

val xy = $(1, "1")
val xy = swap(swap( xy ))
val yx = $("2", 2)
val yx = swap(swap( yx ))

(* ****** ****** *)

(* end of [swap01.dats] *)
