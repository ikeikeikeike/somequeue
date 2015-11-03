#!/bin/bash

for i in `seq 0 10000`; do
    sleep 5 

    echo "mix exqueue.enqueue $i"
    (cd exqueue; mix exqueue.enqueue $i)
done
