#!/bin/bash

(cd ./rbqueue

# NOKOGIRI_USE_SYSTEM_LIBRARIES=1 \
    rbenv exec bundle install --path vendor/bundle &
)


(cd ./exqueue

mix deps.get &

)


(cd ./goqueue

go get -v -d

)
