%%% -------------------------------------------------------------------
%%% Author  : uabjle
%%% Description : dbase using dets 
%%% 
%%% Created : 10 dec 2012
%%% -------------------------------------------------------------------
-module(misc_oam).  
   
%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------
-define(Terminal,'terminal@c2').
%%---------------------------------------------------------------------
%% Records for test
%%

%% --------------------------------------------------------------------
-compile(export_all).


%% ====================================================================
%% External functions
%% ====================================================================
print(Text)->
    rpc:call(?Terminal,terminal,print,[Text]).

print(Text,List)->
    rpc:call(?Terminal,terminal,print,[Text,List]).
%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% --------------------------------------------------------------------
node(Name)->
    {ok,HostId}=net:gethostname(),
    list_to_atom(Name++"@"++HostId).
%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% --------------------------------------------------------------------
