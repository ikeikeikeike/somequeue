#!/bin/bash

trap "exit" INT

for i in `seq 0 10000`; do
    sleep 3

    echo "mix exqueue.enqueue $i"
    (cd exqueue; mix exqueue.enqueue $i)
done
