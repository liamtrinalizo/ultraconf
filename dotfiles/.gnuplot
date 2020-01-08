set terminal x11 background rgb 'black'

set linetype 1  lc rgb 'red' pointtype 10
set linetype 10 lc rgb 'green' dashtype 3
set grid lt 10
set key left textcolor "green"
set border 31 linecolor "green"
set xlabel "X" textcolor rgb 'red'
set ylabel "Y" textcolor rgb 'red'

set isosamples 50
set hidden3d
