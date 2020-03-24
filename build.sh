#!/usr/bin/env bash

tar cvzf pyFF-1.0.1.patch.tar.gz pyFF-1.0.1
docker build --no-cache -t registry.diginfra.net/janpieterk/pyff:base .
