%%------------------------------------------------------------
%%
%% Implementation stub file
%% 
%% Target: CosNotification_Property
%% Source: /net/isildur/ldisk/daily_build/otp_prebuild_r13b01.2009-06-07_20/otp_src_R13B01/lib/cosNotification/src/CosNotification.idl
%% IC vsn: 4.2.21
%% 
%% This file is automatically generated. DO NOT EDIT IT.
%%
%%------------------------------------------------------------

-module('CosNotification_Property').
-ic_compiled("4_2_21").


-include("CosNotification.hrl").

-export([tc/0,id/0,name/0]).



%% returns type code
tc() -> {tk_struct,"IDL:omg.org/CosNotification/Property:1.0","Property",
                   [{"name",{tk_string,0}},{"value",tk_any}]}.

%% returns id
id() -> "IDL:omg.org/CosNotification/Property:1.0".

%% returns name
name() -> "CosNotification_Property".


