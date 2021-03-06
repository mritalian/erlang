%% -*- erlang-indent-level: 2 -*-
%%
%% %CopyrightBegin%
%% 
%% Copyright Ericsson AB 2005-2009. All Rights Reserved.
%% 
%% The contents of this file are subject to the Erlang Public License,
%% Version 1.1, (the "License"); you may not use this file except in
%% compliance with the License. You should have received a copy of the
%% Erlang Public License along with this software. If not, it can be
%% retrieved online at http://www.erlang.org/.
%% 
%% Software distributed under the License is distributed on an "AS IS"
%% basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
%% the License for the specific language governing rights and limitations
%% under the License.
%% 
%% %CopyrightEnd%
%%

-module(hipe_arm_liveness_gpr).
-export([analyse/1]).
-export([liveout/2]).

-include("hipe_arm.hrl").
-include("../flow/liveness.inc").

analyse(CFG) -> analyze(CFG).
cfg_bb(CFG, L) -> hipe_arm_cfg:bb(CFG, L).
cfg_postorder(CFG) -> hipe_arm_cfg:postorder(CFG).
cfg_succ(CFG, L) -> hipe_arm_cfg:succ(CFG, L).
uses(Insn) -> hipe_arm_defuse:insn_use_gpr(Insn).
defines(Insn) -> hipe_arm_defuse:insn_def_gpr(Insn).
liveout_no_succ() ->
  ordsets:from_list(lists:map(fun({Reg,Type}) ->
				  hipe_arm:mk_temp(Reg, Type)
			      end,
			      hipe_arm_registers:live_at_return())).
