
OUTPUT_DIRECTORY=data/`hostname`_`date +%F`/distribution
mkdir -p $OUTPUT_DIRECTORY

for i in 100 1000 10000 100000 1000000; do

    OUTPUT_FILE=$OUTPUT_DIRECTORY/distribution_$i.txt
    touch $OUTPUT_FILE

    for rep in `seq 1 1000`; do
        ./src/parallelQuicksort $i >> $OUTPUT_FILE;
    done ;
done
