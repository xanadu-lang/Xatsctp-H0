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
typedef tyrec = $S2E.tyrec
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
vtypedef
l1tnmopt_vt = Option_vt(l1tnm)
(* ****** ****** *)
absvtype
xctpenv_vtbox = ptr(*boxed*)
vtypedef
xctpenv = xctpenv_vtbox(*boxed*)
(* ****** ****** *)
//
typedef htcst = $H0E.htcst
//
(* ****** ****** *)
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
//
typedef hfarg = $H0E.hfarg
typedef hfarglst = $H0E.hfarglst
//
typedef h0exp = $H0E.h0exp
typedef h0explst = $H0E.h0explst
//
typedef h0dcl = $H0E.h0dcl
typedef h0dclist = $H0E.h0dclist
//
(* ****** ****** *)
typedef h0comped = $H0E.h0comped
(* ****** ****** *)
//
datatype
l1typ =
//
|
L1TYPnone of ()
|
L1TYPsome of ()
|
L1TYPname of string
|
L1TYPtype of (h0typ)
|
L1TYPtyrec of
(int(*bxty*), labl1tnmlst)
|
L1TYPtydat of
(htcst, h0typlst, l1dtclst)
|
L1TYPtyapp of (l1typ, l1tnmlst)
//
and
l1dtc = // HX: for datcons
L1DTCdtcon of (hdcon, l1tnmlst)
//
where
labl1tnm = slabeled(l1tnm)
and l1dtclst = List0(l1dtc)
and labl1tnmlst = List0(labl1tnm)
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
(h0pkg: h0comped): void
//
(* ****** ****** *)

fun
tyrec2bxty(tyrec) : int

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
l1tnm_get_htyp(l1tnm): h0typ
fun
l1tnm_get_ltyp(l1tnm): l1typ
fun
l1tnm_get_stamp(l1tnm): stamp
//
fun
l1tnm_set_ltyp
(ltnm: l1tnm, lctp: l1typ): void
//
fun
l1tnm_make_htyp(h0typ): l1tnm
//
#symload .htsz with l1tnm_get_htsz
#symload .htyp with l1tnm_get_htyp
//
#symload .ltyp with l1tnm_get_ltyp
#symload .ltyp with l1tnm_set_ltyp
//
#symload .stamp with l1tnm_get_stamp
//
(* ****** ****** *)

fun l1typ2bxty(l1typ): int

(* ****** ****** *)
//
fun
print_l1typ: print_type(l1typ)
fun
prerr_l1typ: prerr_type(l1typ)
fun
fprint_l1typ: fprint_type(l1typ)
//
overload print with print_l1typ
overload prerr with prerr_l1typ
overload fprint with fprint_l1typ
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
fun
fprint_labl1tnm: fprint_type(labl1tnm)
//
(* ****** ****** *)
//
fun
h0typ_ltnmize_rec0(h0typ): void
fun
h0typ_ltnmize_rec1(h0typ): l1tnm
//
(* ****** ****** *)
//
fun
l1tnm_ltypize(l1tnm): l1typ
fun
h0typ_ltypize_rec1(h0typ): l1typ
//
(* ****** ****** *)
//
fun
the_ltnmmap_ltypize(): void
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
l1tnm_temit
(out:FILEref, ltnm:l1tnm): void
//
fun
the_ltnmmap_temit(FILEref): void
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
//
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
