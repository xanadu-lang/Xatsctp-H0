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
#staload
STM =
"{$XATSOPT}/SATS/xstamp0.sats"
#staload
LAB =
"{$XATSOPT}/SATS/xlabel0.sats"
//
(* ****** ****** *)
typedef stamp = $STM.stamp
typedef label = $LAB.label
(* ****** ****** *)
#staload
H0E =
"{$XATSOPT}/SATS/intrep0.sats"
(* ****** ****** *)
//
abstbox l1tnm_tbox = ptr
typedef l1tnm = l1tnm_tbox
//
(* ****** ****** *)
//
typedef h0typ = $H0E.h0typ
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
absvtype
xctpenv_vtbox = ptr(*boxed*)
vtypedef xctpenv=xctpenv_vtbox
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
l1tnm_get_type(l1tnm): h0typ
fun
l1tnm_get_stamp(l1tnm): stamp
//
fun
l1tnm_make_type(h0typ): l1tnm
//
#symload
.type with l1tnm_get_type
#symload
.stamp with l1tnm_get_stamp
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
fun
h0typ_tnmize(h0typ): l1tnm
fun
h0typ_tnmize_rec(h0typ): l1tnm
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
