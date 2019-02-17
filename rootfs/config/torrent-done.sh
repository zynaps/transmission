#!/usr/bin/env bash

set -xe

env

if [[ -d "$TR_TORRENT_DIR/$TR_TORRENT_NAME" ]]; then
    [[ $(ls "$TR_TORRENT_DIR/$TR_TORRENT_NAME/"*.{avi,srt} | wc -l) -ne "2" ]] && exit

    enconv -L ru "$TR_TORRENT_DIR/$TR_TORRENT_NAME/$TR_TORRENT_NAME".srt || exit

    mv -i -f "$TR_TORRENT_DIR/$TR_TORRENT_NAME/"*.{avi,srt} /plex/data/movies
else
    mv -i -f "$TR_TORRENT_DIR/$TR_TORRENT_NAME" /plex/data/movies
fi

transmission-remote --torrent $TR_TORRENT_ID --remove-and-delete
