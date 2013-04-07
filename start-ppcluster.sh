#!/bin/bash

tmp=$(tempfile)
trap "rm -f '$tmp'" exit

source run-distributed.sh virtualenv-ppserver.sh | tee $tmp

NUM_NODES=$(cat $tmp | wc -l)
NUM_CPUS=$(cat $tmp | cut -f 2 -d" " | paste -sd+ - | bc)

echo "Cluster started on $NUM_NODES nodes with $NUM_CPUS" cpus
