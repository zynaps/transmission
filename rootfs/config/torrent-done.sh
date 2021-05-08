#!/usr/bin/env bash

set -xe

env

if [[ -d "$TR_TORRENT_DIR/$TR_TORRENT_NAME" ]]; then
    if [[ $(ls "$TR_TORRENT_DIR/$TR_TORRENT_NAME/"*.{avi,srt} | wc -l) -ne "2" ]]; then
      exit
    else
      mv -f "$TR_TORRENT_DIR/$TR_TORRENT_NAME/"*.{avi,srt} /movies
    fi
else
    mv -f "$TR_TORRENT_DIR/$TR_TORRENT_NAME" /movies
fi

transmission-remote --torrent $TR_TORRENT_ID --remove-and-delete
