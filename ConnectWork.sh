#!/bin/sh

# setup a remote connection via ssh and attach to a running tmux session
# retry connection when it fails

SERVERNAME="covenant"
TMUX_SESSION="work"

until ssh -C -t -o "ServerAliveInterval 1" -o "ServerAliveCountMax 5" ${SERVERNAME} tmux attach-session -t ${TMUX_SESSION}; do
    echo "Server 'ssh' crashed with exit code $?.  Respawning.." >&2
    sleep 1
done
