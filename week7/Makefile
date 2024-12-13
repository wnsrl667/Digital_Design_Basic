clean:
	sdf
set:
	sdf
compile:
	xmvlog -MESS -linedebug ./*.v
elab:
	xmelab -MESS -access rwc tb_mux4x1
sim:
	xmsim -MESS tb_mux4x1 -gui
all: compile elab sim
