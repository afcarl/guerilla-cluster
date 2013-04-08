#!/bin/bash
SCRIPT=$1
REMOTE_USER=username

function enumerate_lab_machines
{
    for i in $(seq $2)
    do
        echo $REMOTE_USER@$1-$i.cs.mcgill.ca
    done
}

function enumerate_machines
{
    enumerate_lab_machines lab1 16 # Quad i5
    enumerate_lab_machines lab6 28 # Quad i5
    enumerate_lab_machines lab2 49 # Core 2
    enumerate_lab_machines lab7 28 # Core 2

#    enumerate_lab_machines lab3 16 # Down
#    enumerate_lab_machines lab4 18 # Down
#    enumerate_lab_machines lab5 18 # Down
#    enumerate_lab_machines lab9 10 # Down

}

enumerate_machines | xargs -P50 -n1 -I{}\
    bash -c "ssh -q -x -o StrictHostKeyChecking=no -o ConnectTimeout=1 -o BatchMode=yes\
    {} 'cat | bash /dev/stdin' < $SCRIPT || true"
