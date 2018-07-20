#!/usr/bin/expect
#trap sigwinch spawned
trap {
 set rows [stty rows]
 set cols [stty columns]
 stty rows $rows columns $cols < $spawn_out(slave,name)
} WINCH
set keyPass1 [lindex $argv 0]
set keyPass2 [lindex $argv 1]
set host [lindex $argv 2]
set port [lindex $argv 3]
set timeout 5 
spawn ssh $host -p $port
expect {
        "session (y/n) ?"
        {send "n\n";exp_continue}
        "Enter to continue..."
        {send "\n";exp_continue}
        "password:"
        {send "$keyPass1\n";exp_continue}
        "auth\]:"
        {send "$keyPass2\n";exp_continue}
}
interact
