# NAME

golger - riemann log cat from the shell

# DESCRIPTION

This cli tool will subscribe to a riemann websocket and dump events to the console.

# SYNOPSIS

Dump sshd logs from node01:

    golger node01 sshd

Dump all events from node01:

    golger node01

Full query:

    golger -q 'host = "node01" and tagged "syslog"'

Explicit server:

    golger -s myriemann:5556 -q 'state != "ok"'

Using server defined in configfile:

    golger -c /etc/golger.conf ...

Again but using environment variable in b\*sh:

    GOLGER_CONFIG_FILE=/etc/golger.yaml golger node01

Using explicit host/service lookup:

    golger -H node02 -S httpd

Help:

    golger -h
