#!/usr/bin/expect -f

set timeout -1

spawn ./redis_cluster.sh

expect "*accept*"

send -- "yes\r"

expect eof
