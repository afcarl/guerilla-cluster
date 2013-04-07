#!/bin/bash
function print_line
{
    for i in $(seq 1 $1);do echo -n =;done
    echo
}

tmp=$(tempfile)
trap "rm -f '$tmp'" exit

source run-distributed.sh node-info.sh | tee $tmp

LINE_LEN=$(cat $tmp | wc -L)
NUM_NODES=$(cat $tmp | wc -l)
NUM_CPUS=$(cat $tmp | cut -f 3 -d" " | paste -sd+ - | bc)
FREE_MEM=$(cat $tmp | cut -f 4 -d" " | paste -sd+ - | bc)
TOTAL_MEM=$(cat $tmp | cut -f 5 -d" " | paste -sd+ - | bc)

print_line $LINE_LEN
echo "Hostname Arch Ncpus Free Mem Distrib Processor"
print_line $LINE_LEN

echo "Free memory:     $FREE_MEM Mb"
echo "Total memory:    $TOTAL_MEM Mb"
echo "Number of cpus:  $NUM_CPUS"
echo "Number of nodes: $NUM_NODES"
