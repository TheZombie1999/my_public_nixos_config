#! /usr/bin/env nix-shell
#! nix-shell -i bash -p termdown o

# Run
termdown --exec-cmd "if [ '{0}' == '5' ]; then mpv ~/Personal/Playlists/Rammstein/Angst.mkv; fi" -c 1 30m
termdown --exec-cmd "if [ '{0}' == '5' ]; then speaker-test -t sine -f 1000 -l 1 ; fi" -c 1 5m 


