set list_seq ""
set list_para ""
set list_buitin ""

foreach size {1000000 100000 10000 1000 100} {
    set list_seq ""
    set list_para ""
    set list_buitin ""
    set i 0

    set file_index [open distribution_$size.txt r]
        while {![eof $file_index]} {
            gets $file_index line

            if {[regexp {([0-9.]+)} $line vv num]} {

                if {$i eq 0} {
                    lappend list_seq $num
                } elseif {$i eq 1} {
                    lappend list_para $num
                } else {
                    lappend list_buitin $num
                }

            }

            incr i
            if {$i>2} {
                set i 0
            }
        }
    close $file_index

    set file_index [open ${size}_seq w]
    foreach item $list_seq {
        puts $file_index $item
    }
    close $file_index

    set file_index [open ${size}_para w]
    foreach item $list_para {
        puts $file_index $item
    }
    close $file_index

    set file_index [open ${size}_builtin w]
    foreach item $list_buitin {
        puts $file_index $item
    }
    close $file_index
}

