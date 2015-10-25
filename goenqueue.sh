#!/bin/sh

(cd goqueue

go build

for i in `seq 0 10000`; do
    sleep 5 

    echo "./goqueue $i"
    ./goqueue $i
done

)
