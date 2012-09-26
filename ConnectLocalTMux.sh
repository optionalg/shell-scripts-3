#!/bin/bash

# script to set up a local tmux session and populate its windows
# found on the web, modified for local use

SESSION="local"
LOCAL_SYSTEM="negative"

# if the session is already running, just attach to it.
tmux has-session -t $SESSION
if [ $? -eq 0 ]; then
  echo "Session $SESSION already exists. Attaching."
  sleep 1
  tmux attach -t $SESSION
  exit 0;
fi
                 
# otherwise create a new session, named $SESSION, and detach from it
tmux new-session -d -s $SESSION
 
# create initial window with local system name
tmux set-window-option -t $SESSION -g
tmux new-window    -t $SESSION:0 -n ${LOCAL_SYSTEM}
tmux set-window-option -t $SESSION:0
tmux rename-window -t $SESSION:0 -n ${LOCAL_SYSTEM}

# create other windows
tmux new-window    -t $SESSION:1 -n lftp
tmux new-window    -t $SESSION:2 -n pftp
tmux new-window    -t $SESSION:3 -n empire 'telnet empire'
tmux new-window    -t $SESSION:4 -n fritzbox 'telnet fritz.box'

# select first window and attach to session 
tmux select-window -t $SESSION:0
tmux attach -t $SESSION
