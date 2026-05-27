#!/bin/bash

services=("nginx" "mysql" "bluetooth")

running=0

for s in "${services[@]}"; do
    systemctl is-active --quiet "$s" && ((running++))
done

echo "󰒋 $running"