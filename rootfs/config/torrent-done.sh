#!/usr/bin/env sh

set -xe

env

[[ -d "$TR_TORRENT_DIR/$TR_TORRENT_NAME" ]] && exit

mv -i -f "$TR_TORRENT_DIR/$TR_TORRENT_NAME" /plex/data/movies

transmission-remote --torrent $TR_TORRENT_ID --remove
