#!/usr/bin/env sh

set -xe

env

transmission-remote --torrent $TR_TORRENT_ID --remove
