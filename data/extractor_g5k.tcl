foreach item {host10core1  host10core2  host1core1  host1core2  host2core1  host4core1  host4core2  host8core1} {
    set content [exec perl ./csv_quicksort_extractor2.pl g5k/data/$item/a]

    set file_index [open g5k/$item.txt w]
    puts $file_index $content
    close $file_index
}
