#!/usr/bin/expect -f

set timeout -1

spawn ./redis.sh

expect "*accept*"

send -- "yes\r"

expect eof
