(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: April, 2022
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#include
"./../HATS/libxatsopt.hats"
//
(* ****** ****** *)
//
#staload
"{$XATSOPT}/SATS/intrep0.sats"
//
#staload "./../SATS/xatsctp.sats"
//
(* ****** ****** *)
#symload
compare with cmp_stamp_stamp
#symload
compare with cmp_symbol_symbol
(* ****** ****** *)
#symload
fprint with $STM.fprint_stamp
(* ****** ****** *)
fun
htcst_compare
( htc1: htcst
, htc2: htcst): int =
compare
(htc1.stamp(), htc2.stamp())
fun
htvar_compare
( htv1: htvar
, htv2: htvar): int =
compare
(htv1.stamp(), htv2.stamp())
(* ****** ****** *)
#symload compare with htcst_compare
#symload compare with htvar_compare
(* ****** ****** *)
//
fun
tyrec2bxty
(knd0: tyrec): int =
(
case+ knd0 of
//
| TYRECbox0 _ => 1
| TYRECbox1 _ => 1
//
| TYRECflt0 _ => 0
(*
| TYRECflt1 _ => 0
*)
| TYRECflt2 _ => 0
//
) (*case*) // end of [tyrec2bxty]
//
(* ****** ****** *)

local

(* ****** ****** *)
//
#define H0Tbas_t 10
#define H0Tcst_t 20
#define H0Tvar_t 30
#define H0Tlft_t 40
#define H0Tfun_t 50
#define H0Tapp_t 60
#define H0Tlam_t 70
#define H0Ttyext_t 80
#define H0Ttyrec_t 90
//
#define H0Tnone0_t 100
#define H0Tnone1_t 101
//
(* ****** ****** *)

in(* in-of-local *)

fun
h0typ_tag
(h0t0: h0typ): int =
(
case+
h0t0.node() of
| H0Tbas _ => H0Tbas_t
//
| H0Tcst _ => H0Tcst_t
| H0Tvar _ => H0Tvar_t
//
| H0Tlft _ => H0Tlft_t
//
| H0Tfun _ => H0Tfun_t
//
| H0Tapp _ => H0Tapp_t
| H0Tlam _ => H0Tlam_t
//
| H0Ttyext _ => H0Ttyext_t
//
| H0Ttyrec _ => H0Ttyrec_t
//
| H0Tnone0 _ => H0Tnone0_t
| H0Tnone1 _ => H0Tnone1_t
) (* end of [ht0yp_tag] *)

(* ****** ****** *)

#symload .tag with h0typ_tag

(* ****** ****** *)

end(*local*) // end of [local]

(* ****** ****** *)

local

(* ****** ****** *)

(*
HX-2022-04-29:
[h0t1] and [h0t2]
have the same tag!
*)
fun
auxteq
( h0t1: h0typ
, h0t2: h0typ): int =
(
case+
h0t1.node() of
|
H0Tbas(sym1) =>
(
case-
h0t2.node() of
|
H0Tbas(sym2) => compare(sym1, sym2)
)
//
|
H0Tcst(htc1) =>
(
case-
h0t2.node() of
|
H0Tcst(htc2) => compare(htc1, htc2)
)
//
|
H0Tvar(htv1) =>
(
case-
h0t2.node() of
|
H0Tvar(htv2) => compare(htv1, htv2)
)
//
|
H0Tlft(h0t1) =>
(
case-
h0t2.node() of
|
H0Tlft(h0t2) => compare(h0t1, h0t2)
)
//
|
H0Tfun
( npf1
, hts1, h0t1) =>
(
case-
h0t2.node() of
|
H0Tfun
(npf2, hts2, h0t2) =>
let
val sgn = compare(h0t1, h0t2)
in
if (sgn != 0)
then sgn else auxh0ts( hts1, hts2 )
end
)
//
|
H0Tapp
(h0t1, hts1) =>
(
case-
h0t2.node() of
|
H0Tapp
(h0t2, hts2) =>
let
val sgn = compare(h0t1, h0t2)
in
if (sgn != 0)
then sgn else auxh0ts( hts1, hts2 )
end
)
//
|
H0Tlam
(svs1, h0t1) =>
(
case-
h0t2.node() of
|
H0Tlam
(svs2, h0t2) => compare(h0t1, h0t2)
)
//
|
H0Ttyext
(nam1, hts1) =>
(
case-
h0t2.node() of
|
H0Ttyext
(nam2, hts2) =>
let
val sgn = compare(nam1, nam2)
in
if (sgn != 0)
then sgn else auxh0ts( hts1, hts2 )
end
)
//
|
H0Ttyrec
(knd1, npf1, lhts1) =>
(
case-
h0t2.node() of
|
H0Ttyrec
(knd2, npf2, lhts2) =>
let
val sgn =
compare(knd1, knd2) where
{
val knd1 = tyrec2bxty(knd1)
val knd2 = tyrec2bxty(knd2)
}
in
if (sgn != 0)
then sgn else auxlhts(lhts1, lhts2)
end (*let*)//end of [H0Ttyrec]
)
//
|
H0Tnone0 _ =>
(
case-
h0t2.node() of H0Tnone0 _ => 0
)
|
H0Tnone1 _ =>
(
case-
h0t2.node() of H0Tnone1 _ => 0
)
//
) (* case *) // end of [auxteq]

(* ****** ****** *)

and
auxlht
( lx
: labh0typ
, ly
: labh0typ): int =
let
val+SLABELED(l1, x0) = lx
val+SLABELED(l2, y0) = ly
in
let
val
sgn = cmp_label_label(l1, l2)
in
if
(sgn != 0) then sgn else compare(x0, y0)
end
end (*let*) // end of [auxlht]

(* ****** ****** *)

and
auxh0ts
( xs
: h0typlst
, ys
: h0typlst): int =
(
case+ xs of
//
|
list_nil() =>
(
case+ ys of
|
list_nil() => (0)
|
list_cons _ => (~1)
)
//
|
list_cons(x1, xs) =>
(
case+ ys of
|
list_nil() => (1)
|
list_cons(y1, ys) =>
let
val sgn = compare(x1, y1)
in
if
(sgn != 0) then sgn else auxh0ts(xs, ys)
end // end of [list_cons]
)
//
) (*case*) // end of [auxh0ts]

(* ****** ****** *)

and
auxlhts
( lxs
: labh0typlst
, lys
: labh0typlst): int =
(
case+ lxs of
//
|
list_nil() =>
(
case+ lys of
|
list_nil() => (0)
|
list_cons _ => (~1)
)
|
list_cons(lx1, lxs) =>
(
case+ lys of
|
list_nil() => (1)
|
list_cons(ly1, lys) =>
let
val sgn = auxlht(lx1, ly1)
in
if
(sgn != 0)
then sgn else auxlhts( lxs, lys )
end // end of [list_cons]
)
//
) (*case*) // end of [auxlhts]

(* ****** ****** *)

in(*in-of-local*)

implement
h0typ_compare
( h0t1, h0t2 ) =
let
val tg1 = h0t1.tag()
val tg2 = h0t2.tag()
val sgn = compare(tg1, tg2)
in
if
(sgn != 0)
then sgn else auxteq( h0t1, h0t2 )
end // end of [if]

end // end of [local]

(* ****** ****** *)
(*
implement
l1tnm_compare
(tnm1, tnm2) =
compare
(tnm1.stamp(), tnm2.stamp())
*)
(* ****** ****** *)
//
extern
fun
the_ltnmmap_listize
  ( (*void*) ): l1tnmlst_vt
(* ****** ****** *)
extern
fun
the_ltnmmap_search_ref
(h0t0: h0typ): P2tr0(l1tnm)
//
(* ****** ****** *)
//
extern
fun
the_ltnmmap_insert_any
(h0t0: h0typ, ltnm: l1tnm): void
extern
fun
the_ltnmmap_insert_exn
(h0t0: h0typ, ltnm: l1tnm): void
//
(* ****** ****** *)
local
//
fun
h0typ_eval
(h0t0: h0typ): h0typ =
(
case+
h0t0.node() of
//
|
H0Tcst(htc1) =>
let
val
opt = htc1.abstdf2()
in
  case+ opt of
  | None() => h0t0
  | Some(h0t1) => h0t1
end
//
|
H0Tapp(h0f0, h0ts) =>
let
//
val
h0f0 = h0typ_eval(h0f0)
//
(*
val () =
println!
("h0typ_eval: h0f0 = ", h0f0)
*)
//
in
case+
h0f0.node() of
|
H0Tlam
(htvs, body) =>
h0typ_eval(brdx) where
{
val brdx =
h0typ_subst_tvarlst(body, htvs, h0ts)
}
| _ (* non-H0Tlam *) => h0t0
end (* end-H0Tapp *)
//
| _ (* non-H0Tcst/H0Tapp *) => h0t0
//
) (*case*) // end-of-[h0typ_eval]
//
(*
and
auxh0ts
( h0ts
: h0typlst): h0typlst =
list_vt2t
(
list_map<h0typ><h0typ>(h0ts)
) where
{
implement
list_map$fopr<h0typ><h0typ>(x0) = auxeval(x0)
}
*)
//
(* ****** ****** *)
in(*in-of-local*)
(* ****** ****** *)

implement
h0typ_tnmize_rec0
  ( h0t0 ) =
(
//
case+ opt of
| ~
Some_vt _ => ()
| ~
None_vt _ =>
let
val
ltnm =
l1tnm_make_type
  (  h0t0  )
val () =
the_ltnmmap_insert_any
  (  h0t0, ltnm  )
//
val
h0t0 = h0typ_eval(h0t0)
//
in(*in-of-let*)
//
case+
h0t0.node() of
//
| H0Tbas _ => () // atomic
| H0Tcst _ => () // atomic
| H0Tvar _ => () // atomic
| H0Tapp _ => () // abstract
| H0Tfun _ => () // abstract
//
|
H0Tlft(h0t1) => auxh0t0(h0t1)
//
|
H0Tlam
(s2vs, h0t1) => auxh0t0(h0t1)
//
|
H0Ttyrec
(knd0,
 npf0, lhts) => auxlhts(lhts)
|
H0Ttyext//HX: is it abstract?
(tnm0, h0ts) => auxh0ts(h0ts)
//
| H0Tnone0() => ((*void*))
| H0Tnone1(h0t1) => ((*void*))
//
end(*let*) // end of [None_vt]
) where
{
//
fun
auxh0t0
(h0t0: h0typ): void =
(
  h0typ_tnmize_rec0( h0t0 )
)
//
and
auxh0ts
(h0ts: h0typlst): void =
(
case+ h0ts of
|
list_nil() => ()
|
list_cons(h0t1, h0ts) =>
(auxh0t0(h0t1); auxh0ts(h0ts))
) (*case*) // end of [ auxh0ts ]
//
and
auxlhts
(lhts: labh0typlst): void =
(
case+ lhts of
|
list_nil() => ()
|
list_cons(lht1, lhts) =>
let
val+
SLABELED(lab1, h0t1) = lht1
in
(auxh0t0(h0t1); auxlhts(lhts))
end
) (*case*) // end of [ auxlhts ]
//
val
opt = the_ltnmmap_search_opt(h0t0)
//
}(*where*)//end of [h0typ_tnmize_rec0]

implement
h0typ_tnmize_rec1
  ( h0t0 ) =
let
//
val () =
h0typ_tnmize_rec0(h0t0)
//
val
opt = the_ltnmmap_search_opt(h0t0)
//
in
//
case- opt of ~Some_vt(ltnm) => ltnm
//
end(*let*)//end of [h0typ_tnmize_rec1]

end (*local*) // end of [local]

(* ****** ****** *)

local

(* ****** ****** *)
//
#staload
"libats/SATS\
/linmap_avltree.sats"
//
#staload
"libats/DATS/qlist.dats"
#staload _ =
"libats/DATS/linmap_avltree.dats"
//
(* ****** ****** *)
extern
prfun
lemma_p2tr_param
{a:vt0p}
{l:addr}(cp: p2tr(a, l)): [l >= null] void
(* ****** ****** *)
in(* in-of-local *)
(* ****** ****** *)

local

(* ****** ****** *)
typedef
key = h0typ
and
itm = l1tnm
//
typedef
kx2 = @(key,itm)
//
vtypedef
ltnmmap = map(key, itm)
(* ****** ****** *)
var
the_ltnmmap =
linmap_make_nil<>{key,itm}()
val
the_ltnmmap = addr@the_ltnmmap
(* ****** ****** *)
implement
compare_key_key<key>
  (k1, k2) =
(
$effmask_all(h0typ_compare(k1, k2))
)
(* ****** ****** *)
fun
ltnmlst_sort_htsz
( tnms
: List0_vt(l1tnm)
) : List0_vt(l1tnm) =
let
implement
list_vt_mergesort$cmp<l1tnm>
  (x1, x2) =
(
  $effmask_all
  (compare(x1.htsz(), x2.htsz()))
)
in
  list_vt_mergesort<l1tnm>( tnms )
end(*let*)//end-of[ltnmlst_sort_htsz]
(* ****** ****** *)

in(*in-of-local*)

(* ****** ****** *)

implement
the_ltnmmap_listize
  ( (*void*) ) =
(
ltnmlst_sort_htsz
(auxmain(kxs, res))) where
{
//
val res = list_vt_nil(*void*)
//
val map =
$UN.ptr0_get<ltnmmap>(the_ltnmmap)
val kxs = linmap_listize1<key,itm>(map)
val ( ) =
$UN.ptr0_set<ltnmmap>(the_ltnmmap, map)
//
fun
auxmain
( kxs
: List0_vt(kx2)
, res
: List0_vt(itm)): List0_vt(itm) =
(
case+ kxs of
| ~
list_vt_nil() => res
| ~
list_vt_cons(kx2, kxs) =>
let
val res =
list_vt_cons
(kx2.1, res) in auxmain(kxs, res)
end (* end of [list_cons] *)
//
) (*case*) // end-of-[auxmain]
//
} (*where*)//end-of-[the_ltnmmap_listize]

(* ****** ****** *)

implement
the_ltnmmap_search_ref
  (h0t0) = let
//
val
map =
$UN.ptr0_get<ltnmmap>(the_ltnmmap)
val ref =
linmap_search_ref<key,itm>(map,h0t0)
//
in
let
prval () = $UN.cast2void(map)
prval () = lemma_p2tr_param(ref) in ref
end
end // end of [the_ltnmmap_search_ref]

(* ****** ****** *)

implement
the_ltnmmap_search_opt
  (h0t0) = let
//
val
ref = the_ltnmmap_search_ref(h0t0)
//
in
//
if
iseqz(ref)
then None_vt()
else Some_vt($UN.p2tr_get<itm>(ref))
//
end // end of [the_ltnmmap_search_opt]

(* ****** ****** *)
//
implement
the_ltnmmap_insert_any
  (h0t0, ltnm) = let
//
var
map =
$UN.ptr0_get<ltnmmap>(the_ltnmmap)
//
in
(
$UN.ptr0_set<ltnmmap>(the_ltnmmap, map)
) where
{
val () =
linmap_insert_any<key,itm>(map, h0t0, ltnm)
}
end // end of [the_ltnmmap_insert_any]
//
(* ****** ****** *)

implement
the_ltnmmap_insert_exn
  (h0t0, ltnm) = let
//
var
map =
$UN.ptr0_get<ltnmmap>(the_ltnmmap)
//
in
(
$UN.ptr0_set<ltnmmap>(the_ltnmmap, map)
) where
{
val-
~None_vt() =
linmap_insert_opt<key,itm>(map, h0t0, ltnm)
}
end // end of [the_ltnmmap_insert_exn]

(* ****** ****** *)
end (*local*) // end of [local]
(* ****** ****** *)
end (*local*) // end of [local]
(* ****** ****** *)

(* end of [xats_xatsctp_util0.dats] *)
