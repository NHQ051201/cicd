#/bin/bash

nohup lt --port 3000 --subdomain grafana > /dev/null 2>&1 &
nohup lt --port 9090 --subdomain prometheus > /dev/null 2>&1 &
nohup lt --port 9093 --subdomain alert > /dev/null 2>&1 &
