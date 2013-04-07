#!/bin/bash
SCRIPT=$1
REMOTE_USER=username

function enumerate_machines
{
    for i in $(seq $2)
    do
        echo $REMOTE_USER@$1-$i.cs.mcgill.ca
    done
}

enumerate_machines lab1 16 | xargs -P16 -n1 -I{}\
    bash -c "ssh -q -x -o StrictHostKeyChecking=no -o ConnectTimeout=1 -o BatchMode=yes\
    {} 'cat | bash /dev/stdin' < $SCRIPT || true"
