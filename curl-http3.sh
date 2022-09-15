#!/bin/sh

exec docker run -it --rm --network=host ymuski/curl-http3 curl "$@"
