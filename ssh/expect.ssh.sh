#!/usr/bin/expect -f

set timeout -1

exec echo 'starting ssh.proxy...'

spawn ./ssh.sh

expect {
       "*fingerprint*" {send -- "yes\r"; exp_continue}
       "*password*" {send -- "********\r"}
}

expect {
       "*Permission*" {exit 100; exp_continue}
       eof {puts "exiting..."}
}