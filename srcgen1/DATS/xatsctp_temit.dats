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
"share\
/atspre_staload.hats"
#staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#include
"./../HATS/libxatsopt.hats"
//
(* ****** ****** *)
#symload
fprint with $LAB.fprint_label
#symload
fprint with $STM.fprint_stamp
(* ****** ****** *)
//
#staload "./../SATS/xatsctp.sats"
//
(* ****** ****** *)
//
implement
l1tnm_temit
(out, ltnm) =
(
  fprintln!(out, ltnm)
)
//
(* ****** ****** *)
//
fun
l1ctp2bxty
(lctp: l1ctp): int =
(
case+ lctp of
|
L1CTPltnm
(  ltnm  ) =>
l1ctp2bxty(ltnm.lctp())
|
L1CTPtydat _ => 1(*boxed*)
|
L1CTPtyrec(knd0, _) => knd0
//
| _(*rest-of-l1ctp*) => 0(*unboxed*)
)
//
(* ****** ****** *)

implement
the_ltnmmap_temit
  (out) = let
//
fun
auxmain
( out
: FILEref
, tnms
: l1tnmlst_vt): void =
{
//
val () = f0_main1(out, tnms)
val () = f0_main2(out, tnms)
val () = f0_main3(out, tnms)
val () = f0_main4(out, tnms)
val () = f0_main5(out, tnms)
//
val () = list_vt_free( tnms )
} where
{
//
fun
f0_main1
( out
: FILEref
, tnms:
! l1tnmlst_vt): void =
(
case+ tnms of
|
list_vt_nil
((*void*)) => ()
|
list_vt_cons
(tnm1, tnms) =>
(
  f1_ltnm(tnm1)
; f0_main1(out, tnms)
) where
{
fun
f1_ltnm
(tnm1: l1tnm): void =
case+
tnm1.lctp() of
|
L1CTPname(name) =>
let
val stmp = tnm1.stamp()
in(*in-of-let*)
//
fprintln!
(out, "typedef", " ", name, " ", "L1TNM_", stmp, ";")
//
end(*let*)//end-of-[L1CTPname]
|
_(*non-L1CTPname*) => ((*void*))
}
) (*case*) // end of [f0_main1]
//
fun
f0_main2
( out
: FILEref
, tnms:
! l1tnmlst_vt): void =
(
case+ tnms of
|
list_vt_nil
((*void*)) => ()
|
list_vt_cons
(tnm1, tnms) =>
(
  f1_ltnm(tnm1)
; f0_main2(out, tnms)
) where
{
//
fun
f1_ltnm
(tnm1: l1tnm): void =
case+
tnm1.lctp() of
|
L1CTPtydat
( htc1
, h0ts, dtcs) =>
let
val
stmp = tnm1.stamp()
in(*in-of-let*)
//
fprintln!
( out, "typedef"
, " ", "struct{xcmp_ctag_t ctag0;}", " ", "L1TNM_", stmp, ";")
//
end(*let*)//end-of-[L1CTPtydat]
|
_(*non-L1CTPtydat*) => ((*void*))
//
} (*where*) // endof [ f0_main2 ]
)
//
fun
f0_main3
( out
: FILEref
, tnms:
! l1tnmlst_vt): void =
(
case+ tnms of
|
list_vt_nil
((*void*)) => ()
|
list_vt_cons
(tnm1, tnms) =>
(
  f1_ltnm(tnm1)
; f0_main3(out, tnms)
) where
{
fun
f1_ltnm
(tnm1: l1tnm): void =
case+
tnm1.lctp() of
|
L1CTPtyrec
( knd0, l1ts) =>
let
//
val
stmp = tnm1.stamp()
//
fun
g0_l1t1
( l1t1
: labl1ctp): void =
{
val () =
(
case- ctp1 of
|
L1CTPltnm(ltnm) =>
let
val stmp = ltnm.stamp()
in
fprint!(out, "L1TNM_", stmp, " ")
end
)
//
val
bxty =
l1ctp2bxty(ctp1)
//
val () =
let
val
opt = lab1.int()
in
case+ opt of
|
~None_vt() => ()
|
~Some_vt(int) =>
if
(bxty = 0)
then
fprint!(out, "xlab$", int, ";")
else
fprint!(out, "*xlab$", int, ";")
end (*let*) // end of [val]
//
val () =
let
val
opt = lab1.sym()
in
case+ opt of
|
~None_vt() => ()
|
~Some_vt(sym) =>
if
(bxty = 0)
then
fprint!(out, "xlab_", sym, ";")
else
fprint!(out, "*xlab_", sym, ";")
end (*let*) // end of [val]
//
} where
{
val+SLABELED(lab1, ctp1) = l1t1
}
//
fun
g0_l1ts
( l1ts
: labl1ctplst): void =
(
case+ l1ts of
|
list_nil() => ()
|
list_cons(l1t1, l1ts) =>
(g0_l1t1(l1t1); g0_l1ts(l1ts))
)
//
in(*in-of-let*)
fprint!(out, "typedef");
fprint!(out, " ", "struct{"); g0_l1ts(l1ts);
fprintln!(out, "}", " ", "L1TNM_", stmp, ";")
end (*let*)//end-of-[L1CTPtyrec]
|
_(*non-L1CTPtyrec*) => ((*void*))
}
) (*case*) // end of [ f0_main3 ]
//
fun
f0_main4
( out
: FILEref
, tnms:
! l1tnmlst_vt): void =
(
case+ tnms of
|
list_vt_nil
((*void*)) => ()
|
list_vt_cons
(tnm1, tnms) =>
(
  f1_ltnm(tnm1)
; f0_main4(out, tnms)
) where
{
fun
f1_ltnm
(tnm1: l1tnm): void =
case+
tnm1.lctp() of
|
L1CTPtydat
( htc1
, h0ts, dtcs) =>
(
  g0_dtcs(dtcs)) where
{
//
val stmp = tnm1.stamp()
//
fun
g0_dtc1
(dtc1: l1dtc): void =
let
val+
L1DTCdtcon
(hdc1, l1ts) = dtc1
//
fun
g1_l1t1
( argi: int
, l1t1: l1ctp): void =
{
val () =
(
case- l1t1 of
|
L1CTPltnm(ltnm) =>
let
val stmp = ltnm.stamp()
in
fprint!(out, "L1TNM_", stmp)
end
)
//
val
bxty = l1ctp2bxty(l1t1)
//
val () =
(
if
(bxty = 0)
then
fprint!(out, " ", "carg", argi, ";")
else
fprint!(out, " ", "*carg", argi, ";")
)
}
fun
g1_l1ts
( argi: int
, l1ts: l1ctplst): void =
(
case+ l1ts of
|
list_nil() => ()
|
list_cons
(l1t1, l1ts) =>
(
g1_l1t1(argi, l1t1); g1_l1ts(argi+1, l1ts)
)
)
//
val ctag =
$H0E.h0con_get_ctag(hdc1)
//
in
fprint!
( out
, "typedef", " "
, "struct{xcmp_ctag_t ctag0;");
g1_l1ts(  1(* argi *), l1ts  );
fprintln!
( out, "}", " ", "L1TNM_", stmp, "_", ctag, ";")
end (*let*) // end of [g0_dtc1]
//
fun
g0_dtcs
(dtcs: l1dtclst): void =
(
case+ dtcs of
|
list_nil() => ()
|
list_cons(dtc1, dtcs) =>
(g0_dtc1(dtc1); g0_dtcs(dtcs))
)
//
}(*where*)//end-of[L1CTPtydat]
|
_(*non-L1CTPtydat*) => ((*void*))
}
) (*case*) // end of [ f0_main4 ]
//
fun
f0_main5
( out
: FILEref
, tnms:
! l1tnmlst_vt): void =
(
case+ tnms of
|
list_vt_nil
((*void*)) => ()
|
list_vt_cons
(tnm1, tnms) =>
(
  f1_ltnm(tnm1)
; f0_main5(out, tnms)
) where
{
fun
f1_ltnm
(tnm1: l1tnm): void =
let
val
ctp1 = tnm1.lctp()
in
//
case+ ctp1 of
|
L1CTPname _ => ()
|
L1CTPtydat _ => ()
|
L1CTPtyrec _ => ()
|
_(*rest-of-l1ctp*) =>
let
val
stmp = tnm1.stamp()
in
fprintln!
(out, "// typedef", " ", "L1TNM_", stmp, "=", ctp1)
end (*let*)//end of [L1CTP...]
//
end (*let*)// end of [f1_ltnm]
}
) (*case*) // end of [f0_main5]
//
} (*where*) // end of [auxmain]
//
in(*in-of-let*)
//
auxmain(out, the_ltnmmap_listize())
//
end (* end of [the_ltnmmap_temit] *)

(* ****** ****** *)

(* end of [xats_xatsctp_temit.dats] *)
