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
"./../HATS/libxatsctp.hats"
//
(* ****** ****** *)
#staload $INTREP0(*open-pkg*)
(* ****** ****** *)
#staload "./../SATS/xatsctp.sats"
(* ****** ****** *)
//
fun
h0typ_size
(h0t0: h0typ): int =
(
  auxh0t0(h0t0)) where
{
fun
auxh0t0
(h0t0: h0typ): int =
(
case+
h0t0.node() of
| H0Tbas _ => 1
//
| H0Tcst _ => 1
| H0Tvar _ => 1
//
|
H0Tlft(h0t1) => auxh0t0(h0t1) + 1
//
|
H0Tfun
( npf0
, h0ts, h0t1) =>
auxh0ts(h0ts) + auxh0t0(h0t1) + 1
//
|
H0Tapp
(h0t1, h0ts) =>
auxh0t0(h0t1) + auxh0ts(h0ts) + 1
|
H0Tlam
(htvs, h0t1) => auxh0t0(h0t1) + 1
//
|
H0Ttyext
(name, h0ts) => auxh0ts(h0ts) + 1
//
|
H0Ttyrec
( knd0
, npf1, lhts) => auxlhts(lhts) + 1
//
|H0Tnone0 _ =>(0)|H0Tnone1 _ =>(0)
) (*case*) // end of [auxh0t0]
//
and
auxh0ts
(h0ts: h0typlst): int =
(
case+ h0ts of
|
list_nil() => 0
|
list_cons
(h0t1, h0ts) =>
(
  auxh0t0( h0t1 ) + auxh0ts( h0ts )
)
) (*case*) // end of [auxh0ts]
//
and
auxlhts
(lhts: labh0typlst): int =
(
case+ lhts of
|
list_nil() => 0
|
list_cons
(lht1, lhts) =>
let
val+
$S2E.SLABELED(l1, h0t1) = lht1
in
  auxh0t0( h0t1 ) + auxlhts( lhts )
end
) (*case*) // end of [auxlhts]
//
} (*where*) // end of [ h0typ_size ]
//
(* ****** ****** *)

local
//
typedef
l1tnm_struct =
@{
  l1tnm_htsz= (int)
, l1tnm_type= h0typ
, l1tnm_lctp= l1ctp
, l1tnm_stamp= stamp
} // end of [l1tnm_struct]
//
absimpl
l1tnm_tbox = ref(l1tnm_struct)
//
(* ****** ****** *)
in(* in-of-local *)
(* ****** ****** *)

implement
l1tnm_make_type
  ( h0t0 ) =
let
//
val
stmp =
l1tnm_stamp_new()
//
in(*in-of-let*)
//
ref<l1tnm_struct>
(
@{
, l1tnm_htsz=htsz
, l1tnm_type=h0t0
, l1tnm_lctp=lctp
, l1tnm_stamp=stmp
}
) where
{
  val htsz =
  h0typ_size(h0t0)
  val lctp = L1CTPnone()
}
//
end//end-of-[l1tnm_make_type]

(* ****** ****** *)
//
implement
l1tnm_get_htsz(x0) = x0->l1tnm_htsz
implement
l1tnm_get_type(x0) = x0->l1tnm_type
implement
l1tnm_get_lctp(x0) = x0->l1tnm_lctp
implement
l1tnm_get_stamp(x0) = x0->l1tnm_stamp
//
(*
implement
l1tnm_set_kind
(x0, knd1) =
(x0->l1tnm_kind := knd1)
*)
implement
l1tnm_set_lctp
(x0, lctp) =
(x0->l1tnm_lctp := lctp) where
{
(*
  val () = ( x0->l1tnm_kind := (1) )
*)
} (*where*)//end-of-[l1tnm_set_lctp]
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_xatsctp_l1tnm.dats] *)
