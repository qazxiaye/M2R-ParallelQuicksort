set list_seq ""
set list_para ""
set list_buitin ""

foreach size {10 100 1000 10000 100000} {
    set list_seq ""
    set list_para ""
    set list_buitin ""
    set i 0
    set count 0
    set sum_seq 0
    set sum_para 0
    set sum_libc 0
    set ave_seq 0
    set ave_para 0
    set ave_libc 0
    
    set file_index [open distribution_$size.txt r]
        while {![eof $file_index]} {
            gets $file_index line

            if {[regexp {([0-9.]+)} $line vv num]} {

                if {$i eq 0} {
                    lappend list_seq $num
                    set sum_seq [expr $sum_seq + $num]
                } elseif {$i eq 1} {
                    lappend list_para $num
                    set sum_para [expr $sum_para + $num]
                } else {
                    lappend list_buitin $num
                    set sum_libc [expr $sum_libc + $num]
                }

            }

            incr i
            if {$i>2} {
                set i 0
                incr count;
            }
        }
    close $file_index

    set ave_seq [expr $sum_seq/$count]
    set ave_para [expr $sum_para/$count]
    set ave_libc [expr $sum_libc/$count]
    set sum_seq 0
    set sum_para 0
    set sum_libc 0

    puts "$ave_seq"
    puts "$ave_para"
    puts "$ave_libc"

    set file_index [open ${size}_seq w]
    foreach item $list_seq {
        set sum_seq [expr $sum_seq+($item-$ave_seq)*($item-$ave_seq)]
        puts $file_index $item
    }
    close $file_index

    set inter [expr $sum_seq/$count/($count-1)]
    set inter [expr sqrt($inter)]
    puts "[expr 2*$inter]"



    set file_index [open ${size}_para w]
    foreach item $list_para {
        set sum_para [expr $sum_para+($item-$ave_para)*($item-$ave_para)]
        puts $file_index $item
    }
    close $file_index

    set inter [expr $sum_para/$count/($count-1)]
    set inter [expr sqrt($inter)]
    puts "[expr 2*$inter]"



    set file_index [open ${size}_builtin w]
    foreach item $list_buitin {
        set sum_libc [expr $sum_libc+($item-$ave_libc)*($item-$ave_libc)]
        puts $file_index $item
    }
    close $file_index

    set inter [expr $sum_libc/$count/($count-1)]
    set inter [expr sqrt($inter)]
    puts "[expr 2*$inter]"
}

