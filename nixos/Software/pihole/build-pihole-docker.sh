#!/usr/bin/env nix-shell
#! nix-shell -i bash -p docker-compose

pushd ~/.config/pihole
 sudo docker-compose up -d
popd