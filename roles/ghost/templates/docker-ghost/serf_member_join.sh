#!/usr/bin/env bash

if [ "x${SERF_SELF_ROLE}" != "postgres" ]; then
    echo "Not a database. Ignoring member join."
    exit 0
fi

export
