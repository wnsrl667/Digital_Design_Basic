clean:
	rm -rf cds.lib hdl.var *.lib waves.shm *.log *.key

set:
	touch cds.lib hdl.var
	mkdir work.lib
	echo "define sim ./work.lib" >> ./cds.lib
	echo "define WORK sim" >> ./hdl.var

compile:
	xmvlog -MESS -linedebug ../src/*.v

elab:
	xmelab -MESS -access rwc tb_adder

sim: 
	xmsim -MESS tb_adder -gui

all: clean set compile elab sim
