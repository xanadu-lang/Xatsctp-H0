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
// Start Time: May 19th, 2022
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
"./../HATS/libxatsctp.hats"
//
(* ****** ****** *)
#symload
.int with $LAB.label_get_int
#symload
.sym with $LAB.label_get_sym
(* ****** ****** *)
#symload
fprint with $LAB.fprint_label
#symload
fprint with $STM.fprint_stamp
#symload
fprint with $SYM.fprint_symbol
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
fprintln!
(out, "xtnm_", stmp)) where
{
val stmp = ltnm.stamp((*void*))
}
//
(* ****** ****** *)

local
//
fun
my_main1
( out
: FILEref,
  tnms:
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
  f1_tnm1(tnm1)
; my_main1(out, tnms)
) where
{
fun
f1_tnm1
(tnm1: l1tnm): void =
case+
tnm1.ltyp() of
|
L1CTPname(name) =>
let
val stmp = tnm1.stamp()
in(*in-of-let*)
//
fprintln!
(out, "typedef", " ", name, " ", "xtnm_", stmp, ";")
//
end(*let*)//end-of-[L1CTPname]
|
_(*non-L1CTPname*) => ((*void*))
}
) (*case*) // end of [ my_main1 ]
//
fun
my_main2
( out
: FILEref,
  tnms:
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
  f1_tnm1(tnm1)
; my_main2(out, tnms)
) where
{
//
fun
f1_tnm1
(tnm1: l1tnm): void =
case+
tnm1.ltyp() of
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
, " ", "struct{xcmp_ctag_t ctag0;}", " ", "xtnm_", stmp, ";")
//
end(*let*)//end-of-[L1CTPtydat]
|
_(*non-L1CTPtydat*) => ((*void*))
//
} (*where*) // endof [ my_main2 ]
)
//
fun
my_main3
( out
: FILEref,
  tnms:
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
; my_main3(out, tnms)
) where
{
fun
f1_ltnm
(tnm1: l1tnm): void =
case+
tnm1.ltyp() of
|
L1CTPtyrec
(knd0, flds) =>
let
//
val
stmp = tnm1.stamp()
//
fun
g1_fld1
( fld1
: labl1tnm): void =
{
//
val l1t1 = ltnm.ltyp()
val bxty = l1ctp2bxty(l1t1)
//
val () =
let
val stmp = ltnm.stamp()
in
fprint!(out, "xtnm_", stmp, " ")
end
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
val+$S2E.SLABELED(lab1, ltnm) = fld1
}
//
fun
g1_flds
( flds
: labl1tnmlst): void =
(
case+ flds of
|
list_nil() => ()
|
list_cons(fld1, flds) =>
(g1_fld1(fld1); g1_flds(flds))
)
//
in(*in-of-let*)
fprint!(out, "typedef");
fprint!(out, " ", "struct{"); g1_flds(flds);
fprintln!(out, "}", " ", "xtnm_", stmp, ";")
end (*let*)//end-of-[L1CTPtyrec]
|
_(*non-L1CTPtyrec*) => ((*void*))
}
) (*case*) // end of [ my_main3 ]
//
fun
my_main4
( out
: FILEref,
  tnms:
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
  f1_tnm1(tnm1)
; my_main4(out, tnms)
) where
{
fun
f1_tnm1
(tnm1: l1tnm): void =
case+
tnm1.ltyp() of
|
L1CTPtydat
( htc1
, h0ts, dtcs) =>
(
  g1_dtcs(dtcs)) where
{
//
val stmp = tnm1.stamp()
//
fun
g1_dtc1
(dtc1: l1dtc): void =
let
val+
L1DTCdtcon
(hdc1, args) = dtc1
//
fun
g2_tnm1
( argi: int
, tnm1: l1tnm): void =
{
//
val
l1t1 = tnm1.ltyp()
val
bxty = l1ctp2bxty(l1t1)
//
val () =
let
val
stmp = tnm1.stamp()
in
fprint!(out, "xtnm_", stmp)
end
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
//
} (* end of [g2_tnms1] *)
//
fun
g2_tnms
( argi: int
, args: l1tnmlst): void =
(
case+ args of
|
list_nil() => ()
|
list_cons
(tnm1, args) =>
(
g2_tnm1(argi, tnm1); g2_tnms(argi+1, args)
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
g2_tnms(  1(* argi *), args  );
fprintln!
( out, "}", " ", "xtnm_", stmp, "_", ctag, ";")
end (*let*) // end of [g1_dtc1]
//
fun
g1_dtcs
(dtcs: l1dtclst): void =
(
case+ dtcs of
|
list_nil() => ()
|
list_cons(dtc1, dtcs) =>
(g1_dtc1(dtc1); g1_dtcs(dtcs))
)
//
}(*where*)//end-of[L1CTPtydat]
|
_(*non-L1CTPtydat*) => ((*void*))
}
) (*case*) // end of [ my_main4 ]
//
fun
my_main5
( out
: FILEref,
  tnms:
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
; my_main5(out, tnms)
) where
{
fun
f1_ltnm
(tnm1: l1tnm): void =
let
val
l1t1 = tnm1.ltyp()
in
//
case+ l1t1 of
|
L1CTPname _ => ()
|
L1CTPtydat _ => ()
|
L1CTPtyrec _ => ()
|
_(*rest-of-l1ctp*) =>
let
val stmp = tnm1.stamp()
in
fprintln!
(out, "// typedef", " ", "xtnm_", stmp, "=", l1t1)
end (*let*)//end of [L1CTP...]
//
end (*let*)// end of [f1_ltnm]
}
) (*case*) // end of [ my_main5 ]

//
in(*in-of-local*)

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
val () = my_main1(out, tnms)
val () = my_main2(out, tnms)
val () = my_main3(out, tnms)
val () = my_main4(out, tnms)
val () = my_main5(out, tnms)
//
val () = list_vt_free( tnms )
}
//
in
auxmain(out, the_ltnmmap_listize())
end(*let*)//end-of-[the_ltnmmap_temit]

end (*local*) // end of [local]

(* ****** ****** *)

(* end of [xats_xatsctp_temit0.dats] *)
