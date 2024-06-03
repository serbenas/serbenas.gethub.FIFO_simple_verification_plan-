vlib work
vlog FIFO.v tb_FIFO.sv   +cover
vsim -voptargs=+acc work.top_FIFO -cover
add wave *
coverage save top_FIFO.ucdb -onexit
vcover report top_FIFO.ucdb -details -all -annotate -output report.txt
run -all