set table "resumen.pgf-plot.table"; set format "%.5f"
set format "%.7e";; set samples 30, 30; set dummy x,y; set isosamples 30, 30; splot [x=-2:2] [y=-2:2] x**2 - y**2;
