Scripts
=======

This repository contains some helper scripts that were created to automate repetitive tasks and to make ones life
easier.

### ConnectLocalTMux.sh

Create local tmux session, set up some windows and attach to the session. Nice example to prepopulate a new tmux session.

### ConnectWork.sh

Script to connect to a tmux session running remote. The scripts retries to connect to the session every 1s until it
finally establishes the connect. Useful to run as startup script of a local shell (e.g. in MacOS X), so that the
shell tries to reconnect to the tmux session after e.g. your notebook woke up from hibernation/sleep.

### RenameMP4Files.sh

Set file name of mp4 movie files according to its metadata in the format '<EP#> <EP Name>.mp4' (aka 'The iTunes Naming
Convention'). Preprocess your video files with e.g. [VideoMonkey](http://videomonkey.org/) to add some metadata in the first place.