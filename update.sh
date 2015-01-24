#!/usr/bin/env bash

now=$(date +%s)
let ts=now-86400-1

function get_random_number {
    min=$1
    max=$2
    number=0

    while [ $number -le $min ]; do
        number=$RANDOM
        let number%=$max
    done

    echo $number
}

while [ $ts -lt $now ]; do
    temp1=`get_random_number 10 20`
    temp2=`get_random_number 20 25`
    hum=`get_random_number 40 70`
    rrdtool update temp.rrd $ts:$temp1:$temp2:$hum
    let ts=ts+600
done

