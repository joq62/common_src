all:
#	service
	cp src/*.app ebin;
	erlc -o ebin src/*.erl;
	rm -rf src/*.beam *.beam  test_src/*.beam test_ebin/*;
	rm -rf  *~ */*~  erl_cra*;
	rm -rf *_specs *_config *.log;
	echo Done
doc_gen:
	echo glurk not implemented
test:
	rm -rf ebin/* src/*.beam *.beam test_src/*.beam test_ebin/*;
	rm -rf  *~ */*~  erl_cra*;
	rm -rf *_specs *_config *.log;
#	service
	cp src/common.app ebin;
	erlc -o ebin src/*.erl;
#	test application
	cp test_src/*.app test_ebin;
	erlc -o test_ebin test_src/*.erl;
	erl -pa ebin -pa test_ebin\
	    -setcookie abc\
	    -sname test_common\
	    -run common_unit_test start_test test_src/test.config
