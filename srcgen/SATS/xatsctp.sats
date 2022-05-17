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
// Start Time: April 2, 2022
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#define
XATSOPT_targetloc
"./../../xatsopt/srcgen/xcomp"
//
(* ****** ****** *)
//
#staload STM =
"{$XATSOPT}/SATS/xstamp0.sats"
#staload LAB =
"{$XATSOPT}/SATS/xlabel0.sats"
//
(* ****** ****** *)
typedef stamp = $STM.stamp
typedef label = $LAB.label
(* ****** ****** *)
//
#staload S2E =
"{$XATSOPT}/SATS/staexp2.sats"
//
sexpdef
slabeled
(a:type) = $S2E.slabeled(a)
//
(* ****** ****** *)
//
#staload H0E =
"{$XATSOPT}/SATS/intrep0.sats"
//
(* ****** ****** *)
abstbox
l1tnm_tbox = ptr(*boxed*)
typedef
l1tnm = l1tnm_tbox(*boxed*)
(* ****** ****** *)
typedef
l1tnmlst = List0(l1tnm)
typedef
l1tnmopt = Option(l1tnm)
vtypedef
l1tnmlst_vt = List0_vt(l1tnm)
(* ****** ****** *)
absvtype
xctpenv_vtbox = ptr(*boxed*)
vtypedef
xctpenv = xctpenv_vtbox(*boxed*)
(* ****** ****** *)
//
typedef htcst = $H0E.htcst
//
typedef h0typ = $H0E.h0typ
typedef h0typlst = $H0E.h0typlst
//
(* ****** ****** *)
//
typedef hdcon = $H0E.hdcon
typedef hdcst = $H0E.hdcst
typedef hdvar = $H0E.hdvar
//
typedef h0pat = $H0E.h0pat
typedef h0patlst = $H0E.h0patlst
typedef hfarg = $H0E.hfarg
typedef hfarglst = $H0E.hfarglst
//
typedef h0exp = $H0E.h0exp
typedef h0explst = $H0E.h0explst
typedef h0dcl = $H0E.h0dcl
typedef h0dclist = $H0E.h0dclist
//
(* ****** ****** *)
typedef h0comped = $H0E.h0comped
(* ****** ****** *)
//
datatype
l1ctp =
//
|
L1CTPnone of ()
|
L1CTPsome of ()
|
L1CTPname of string
|
L1CTPltnm of (l1tnm)
|
L1CTPtype of (h0typ)
|
L1CTPtyrec of
(int(*bxty*), labl1ctplst)
|
L1CTPtydat of
(htcst, h0typlst, l1dtclst)
|
L1CTPtyapp of (l1ctp, l1ctplst)
//
and l1dtc =
L1DTCdtcon of (hdcon, l1ctplst)
//
where
labl1ctp = slabeled(l1ctp)
and l1ctplst = List0(l1ctp)
and l1dtclst = List0(l1dtc)
and labl1ctplst = List0(labl1ctp)
//
(* ****** ****** *)
//
fun
xatsctp_initize(): void
//
(* ****** ****** *)
//
fun
xatsctp_program
  (pkg: h0comped): void
//
(* ****** ****** *)
//
fun
h0typ_compare
(h0typ, h0typ): int(*sign*)
//
#symload
compare with h0typ_compare
//
(* ****** ****** *)
//
fun
xctpenv_make_nil(): xctpenv
fun
xctpenv_free_nil(xctpenv): void
//
(* ****** ****** *)
//
fun
l1tnm_stamp_new(): stamp
//
fun
l1tnm_get_htsz(l1tnm): (int)
fun
l1tnm_get_type(l1tnm): h0typ
fun
l1tnm_get_lctp(l1tnm): l1ctp
fun
l1tnm_get_stamp(l1tnm): stamp
//
fun
l1tnm_set_lctp
(ltnm: l1tnm, lctp: l1ctp): void
//
fun
l1tnm_make_type(h0typ): l1tnm
//
#symload .htsz with l1tnm_get_htsz
#symload .type with l1tnm_get_type
//
#symload .lctp with l1tnm_get_lctp
#symload .lctp with l1tnm_set_lctp
//
#symload .stamp with l1tnm_get_stamp
//
(* ****** ****** *)
//
fun
print_l1ctp: print_type(l1ctp)
fun
prerr_l1ctp: prerr_type(l1ctp)
fun
fprint_l1ctp: fprint_type(l1ctp)
//
overload print with print_l1ctp
overload prerr with prerr_l1ctp
overload fprint with fprint_l1ctp
//
fun
fprint_labl1ctp
(out: FILEref, lx0: labl1ctp): void
//
(* ****** ****** *)
//
fun
print_l1dtc: print_type(l1dtc)
fun
prerr_l1dtc: prerr_type(l1dtc)
fun
fprint_l1dtc: fprint_type(l1dtc)
//
overload print with print_l1dtc
overload prerr with prerr_l1dtc
overload fprint with fprint_l1dtc
//
(* ****** ****** *)
//
fun
print_l1tnm: print_type(l1tnm)
fun
prerr_l1tnm: prerr_type(l1tnm)
fun
fprint_l1tnm: fprint_type(l1tnm)
//
overload print with print_l1tnm
overload prerr with prerr_l1tnm
overload fprint with fprint_l1tnm
//
(* ****** ****** *)
//
(*
HX-2022-05-01:
If a type is given a name,
then all of its subtypes must
have names as well. However,
the subtypes in a datcon need
not be named unless they are
actually used in the code!
*)
//
fun
h0typ_tnmize_rec0(h0typ): void
fun
h0typ_tnmize_rec1(h0typ): l1tnm
//
(* ****** ****** *)
//
fun
l1tnm_ctpize(l1tnm): l1ctp
fun
h0typ_ctpize_rec1(h0typ): l1ctp
//
(* ****** ****** *)
//
fun
the_ltnmmap_ctpize(): void
//
(* ****** ****** *)
fun
the_ltnmmap_search_opt
(h0t0: h0typ): Option_vt(l1tnm)
(* ****** ****** *)
//
fun
the_ltnmmap_listize
  ( (*void*) ): l1tnmlst_vt
//
(* ****** ****** *)
//
fun
l1tnm_temit(ltnm:l1tnm): void
fun
the_ltnmmap_temit((*nil*)): void
//
(* ****** ****** *)
//
fun
xatsctp_h0dcl
( env0:
! xctpenv, dcl0: h0dcl ): void
fun
xatsctp_h0dclist
( env0:
! xctpenv, dcls: h0dclist): void
//
(* ****** ****** *)
//
fun
xatsctp_h0dcl_timp
( env0:
! xctpenv, dcl0: h0dcl ): void
(* ****** ****** *)
//
fun
the_XATSHOME_get((*void*)): string
//
(* ****** ****** *)
//
fun
xatsctp_main0
{n:int | n >= 1}
(argc: int(n), argv: !argv(n)): void
//
(* ****** ****** *)

(* end of [xats_xatsctp.sats] *)
