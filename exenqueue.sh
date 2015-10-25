#!/bin/bash

for i in `seq 0 10000`; do
    sleep 5 

    echo "mix run -e \"Exq.enqueue(:exq, 'default', 'ActiveJob::QueueAdapters::SidekiqAdapter::JobWrapper', [%{'arguments' => [%{'exqueue' => $i}], 'queue_name' => 'default', 'job_class' => 'EchoJob'}])\""

    (cd exqueue; bash mix run -e "Exq.enqueue(:exq, \"default\", \"ActiveJob::QueueAdapters::SidekiqAdapter::JobWrapper\", [%{\"arguments\" => [%{\"exqueue\" => $i}], \"queue_name\" => \"default\", \"job_class\" => \"EchoJob\"}])" )
done
