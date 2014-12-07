#!/bin/sh
# The backslash makes the next line a comment in Tcl \
exec tclsh "$0" ${1+"$@"}

set outputPath "./ubuntu_2014-12-07/tlevel0"

set test_count 1000

set counter(0) 0
set counter(1) 0
set counter(2) 0
set counter(3) 0
set counter(4) 0

set end 0
while {$end == 0} {
    set p [expr {int (rand()*5)}]

    if {$counter($p) < $test_count} {
        set size [expr pow(10,$p+1)]
        set int_size [expr {int ($size)}]

        exec ../src/parallelQuicksort $int_size >> $outputPath/distribution_$int_size.txt

        puts "$int_size $counter($p)"

        incr counter($p)
    } else {
        set r 0
        set i 0
        while {$i < 5} {
            if {$counter($i) < $test_count} {
                set r 1
            }
            incr i
        }
        if {$r == 0} {
            set end 1
        }
    }
}


