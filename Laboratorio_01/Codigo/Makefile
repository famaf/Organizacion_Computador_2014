all: run

run: fsm_tb
	ghdl -r fsm_tb --stop-time=150ns --vcd=fsm.vcd

fsm_tb: fsm fsm_tb.vhdl
	ghdl -a fsm_tb.vhdl
	ghdl -e fsm_tb	

fsm: comp test secu fsm.vhdl
	ghdl -a fsm.vhdl

comp: componentes.vhdl
	ghdl -a componentes.vhdl

ff1b: ff_1b.vhdl
	ghdl -a ff_1b.vhdl

secu: ff1b secuencial.vhdl
	ghdl -a secuencial.vhdl

test: trans_estados.vhdl
	ghdl -a trans_estados.vhdl

clean: 
	rm -rf 1 *_tb *.o *.cf *.vcd
