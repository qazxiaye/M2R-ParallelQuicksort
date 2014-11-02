echo "
  set terminal png size 600,400 
  set output '${1}_wide.png'
  set datafile separator ','
  set key autotitle columnhead
  plot '${1}.txt' using 1:2 with linespoints, '${1}.txt' using 1:3 with linespoints, '${1}.txt' using 1:4 with linespoints
" | gnuplot
echo [[file:${1}_wide.png]]
