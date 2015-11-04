#!/bin/sh

trap "exit" INT

(cd goqueue

for i in `seq 0 10000`; do
    sleep 3

    echo "go run main.go jobs.go $i"
    go run main.go jobs.go $i
done

)
