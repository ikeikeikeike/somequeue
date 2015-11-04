#!/bin/bash
(cd ./rbqueue

rbenv exec bundle exec sidekiq &

trap 'kill $(jobs -p)' EXIT
for f in log/*.log ; do
  tail -f "$f" &
done

wait
)
