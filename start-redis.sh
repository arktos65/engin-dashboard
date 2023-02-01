#!/usr/bin/env zsh
docker run -it --rm -p 6379:6379 --name redis -d redis redis-server --appendonly yes
