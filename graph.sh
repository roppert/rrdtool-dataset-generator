#!/usr/bin/env bash

# tell rrdtool to generate a graph named 'temp.png'
# -w and -h is the size in pixels (width, height) and -a is format (png)
# --slode-mode means a smooth line
# --start -86400 --end now means start 86400 ago (1 day) and end now
# --vertical label defines the label for vertical axis
# 

rrdtool graph temp.png \
    -w 785 -h 120 -a PNG \
    --slope-mode \
    --start -86400 --end now \
    --vertical-label "temp (C)" \
    DEF:temp1=temp.rrd:temp1:MAX \
    DEF:temp2=temp.rrd:temp2:MAX \
    DEF:hum1=temp.rrd:hum:MAX \
    DEF:hum2=temp.rrd:hum:MAX:step=1800 \
    LINE1:temp1#ff0000:"temp 1" \
    LINE1:temp2#0000ff:"temp 2" \
    AREA:hum1#00ff0070:"hum 1" \
    AREA:hum2#ff000030:"hum 2"
