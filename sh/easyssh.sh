#!/bin/bash

SSH_CONFIG="$HOME/.ssh/config"

if [ -f $SSH_CONFIG ]; then

    HOSTS=(`grep "^Host " $SSH_CONFIG | sed s/"^Host "// | grep -v "^\*$"`)

    i=0
    for HOST in "${HOSTS[@]}"
    do
        echo "$i: $HOST"
        let i++
    done
fi

echo "Please select number of connect to..."
read HOST_NO

j=0
for HOST in "${HOSTS[@]}"
do
    if [ $j = $HOST_NO ]; then
        exec ssh $HOST
    fi
    let j++
done
