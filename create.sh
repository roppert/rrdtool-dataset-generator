#!/usr/bin/env bash
#
# tell rrdtool to create a database named 'temp.rrd' with
# the following attributes:
# --step 300 : use a maximum interval of 300 seconds (5 min)
# -b 1422118800 : allow historic data to be inserted, begin
#                 from unix epoch 1422118800 (2015-01-24 18:00)
# DS:temp1:GAUGE:600:0:50 : add a data source (DS) called 'temp1', use 
#                           GAUGE which means use the absolut values.
#                           Heartbeat timeout is 600 seconds, if no data
#                           is added within this interval a 0 value will
#                           be inserted. Min value is 0 and max is 50.
# DS:temp2:GAUGE:600:0:50 : another data source called temp2, same spec
# DS:hum:GAUGE:600:0:100 : another data source called temp2, same spec
# RRA:MAX:0.5:1:288 : Round Robin Archive (RRA), MAX means use max value if
#                     more than one is found in interval. 0.5 is the
#                     internal resolution(?), 1 means one step is necessary
#                     to store final value (no average is made). 288 is
#                     the number of steps to store in the database:
#                     288 * 300 = 86400 = 1 day

start=$(date +%s)
let start=start-86400
rrdtool create temp.rrd \
    --step 300 \
    -b $start \
    DS:temp1:GAUGE:600:0:50 \
    DS:temp2:GAUGE:600:0:50 \
    DS:hum:GAUGE:600:0:100 \
    RRA:MAX:0.5:1:288

