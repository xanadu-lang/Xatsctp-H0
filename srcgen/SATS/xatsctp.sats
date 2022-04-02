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
LAB =
"{$XATSOPT}/SATS/xlabel0.sats"
(* ****** ****** *)
#staload
H0E =
"{$XATSOPT}/SATS/intrep0.sats"
(* ****** ****** *)
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
