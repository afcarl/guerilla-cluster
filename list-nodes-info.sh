#!/bin/bash
function print_line
{
    for i in $(seq 1 $1);do echo -n =;done
    echo
}

tmp=$(tempfile)
trap "rm -f '$tmp'" exit

source run-distributed.sh node-info.sh | tee $tmp

NUM_CPUS=$(cat $tmp | cut -f 4 -d" " | paste -sd+ - | bc)
NUM_NODES=$(cat $tmp | wc -l)
LINE_LEN=$(cat $tmp | wc -L)

print_line $LINE_LEN
echo -e "Hostname    Distrib    Arch    Ncpus    Processor"
print_line $LINE_LEN

echo "Number of nodes: $NUM_NODES"
echo "Number of cpus:  $NUM_CPUS"
