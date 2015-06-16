# NAME

loggmann - riemann log cat from the shell

# DESCRIPTION

This cli tool will subscribe to a riemann websocket and dump events to the console.

# SYNOPSIS

Dump sshd logs from node01:

    loggmann node01 sshd

Dump all events from node01:

    loggmann node01

Full query:

    loggmann -q 'host = "node01" and tagged "syslog"'

Explicit server:

    loggmann -s myriemann:5556 -q 'state != "ok"'

Using server defined in configfile:

    loggmann -c /etc/loggmann.conf ...

Again but using environment variable in b\*sh:

    LOGGMANN_CONFIG_FILE=/etc/loggmann.yaml loggmann node01

Using explicit host/service lookup:

    loggmann -H node02 -S httpd

Help:

    loggmann -h
