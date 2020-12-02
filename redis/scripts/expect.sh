#!/usr/bin/expect -f

set timeout -1

spawn ./start_redis_cluster.sh

expect "*accept*"

send -- "yes\r"

expect eof