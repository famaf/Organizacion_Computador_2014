all: run

run: ff4b_tb
	ghdl -r ff_4b_tb --stop-time=50ns --vcd=ff4b.vcd

ff4b_tb: ff4b ff_4b_tb.vhdl
	ghdl -a ff_4b_tb.vhdl
	ghdl -e ff_4b_tb	

ff4b: comp ff1b ff_4b.vhdl
	ghdl -a ff_4b.vhdl

comp: componentes.vhdl
	ghdl -a componentes.vhdl

ff1b: ff_1b.vhdl
	ghdl -a ff_1b.vhdl

clean: 
	rm -f *_tb
	rm -rf *.o
	rm -rf *.cf
	rm -rf *.vcd
