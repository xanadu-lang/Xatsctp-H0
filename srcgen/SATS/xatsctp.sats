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
"./../../xatsopt/srcgen/xats"
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
abstbox h0tnm_tbox = ptr
typedef h0tnm = h0tnm_tbox
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
absvtype ctpenv_vtbox = ptr
vtypedef ctpenv = ctpenv_vtbox
(* ****** ****** *)
//
fun
ctpenv_make_nil(): ctpenv
fun
ctpenv_free_nil(ctpenv): void
//
(* ****** ****** *)
//
fun
h0tnm_stamp_new(): stamp
//
fun
h0tnm_make(h0typ): h0tnm
//
fun
h0tnm_get_type(h0tnm): h0typ
fun
h0tnm_get_stamp(h0tnm): stamp
//
#symload
.type with h0tnm_get_type
#symload
.stamp with h0tnm_get_stamp
//
(* ****** ****** *)
//
fun
print_h0tnm: print_type(h0tnm)
fun
prerr_h0tnm: prerr_type(h0tnm)
fun
fprint_h0tnm: fprint_type(h0tnm)
//
overload print with print_h0tnm
overload prerr with prerr_h0tnm
overload fprint with fprint_h0tnm
//
(* ****** ****** *)
//
fun
xatsctp_h0dcl
( env0:
! ctpenv, dcl0: h0dcl): void
fun
xatsctp_h0dclist
( env0:
! ctpenv, dcls: h0dclist): void
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
