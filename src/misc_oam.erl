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
-define(TerminalVmId,"terminal").
-define(Terminal,'terminal@c2').
-define(Terminals,['terminal@c2','terminal@c1','terminal@c0']).
-define(Masters,['master@c2','master@c1','master@c0']).
%%---------------------------------------------------------------------
%% Records for test
%%

%% --------------------------------------------------------------------
-compile(export_all).


%% ====================================================================
%% External functions
%% ====================================================================

print(Text,T)->
    rpc:call(?Terminal,terminal,print,[Text],T).

print(Text,List,T)->
    rpc:call(?Terminal,terminal,print,[Text,List],T).
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
get_log_terminals()->
    VmStrList=[{string:lexemes([atom_to_list(Node)],"@"),Node}||Node<-[node()|nodes()]],
    [Node||{[?TerminalVmId,_],Node}<-VmStrList].
   % VmStrList.    
					       

log_terminals()->
    ?Terminals.
masters()->
    ?Masters.
