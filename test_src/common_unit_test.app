%% This is the application resource file (.app file) for the 'base'
%% application.
{application, common_unit_test,
[{description, "common_unit_test  " },
{vsn, "1.0.0" },
{modules, 
	  [common_unit_test_app,common_unit_test_sup,common_unit_test]},
{registered,[common_unit_test]},
{applications, [kernel,stdlib]},
{mod, {common_unit_test_app,[]}},
{start_phases, []}
]}.
