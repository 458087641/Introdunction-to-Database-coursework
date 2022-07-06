#!/bin/bash

real="$1"
schema="$2"
queries="$3"

for i in `seq 1 9`
do
    echo ">>> Testing query file '$queries/0$i.txt' on schema '$schema'"
    java -jar $real -d $schema -q "$(cat $queries/0$i.txt)" -e off > /dev/null
done
