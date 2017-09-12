all: run

run: gray2bits_tb
	ghdl -r gray2bits_tb --stop-time=150ns --vcd=gray2bits.vcd

gray2bits_tb: gray2bits gray2bits_tb.vhdl
	ghdl -a gray2bits_tb.vhdl
	ghdl -e gray2bits_tb	

gray2bits: comp test secu gray2bits.vhdl
	ghdl -a gray2bits.vhdl

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
