#!/bin/bash
set -e

if [ "${1#-}" != "$1" ]; then
	set -- ebusd "$@"
fi

exec "$@" &> /log-pipe &
exec /log-reader.sh < /log-pipe 
