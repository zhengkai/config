#!/bin/bash -e

PID_FILE="$1"
EXE="$2"

PID=""
if [ -n "$PID_FILE" ] && [ -f "$PID_FILE" ]; then
	PID=`cat "$PID_FILE"`
fi
if [ -z "$PID" ] || [ -z "$EXE" ]; then
	>&2 echo no pid or exec
	exit 1
fi

EXE_LINK="/proc/${PID}/exe"

if [ ! -L "$EXE_LINK" ]; then
	>&2 echo no pid $PID
	exit 2
fi
if [ ! -r "$EXE_LINK" ]; then
	>&2 echo can not read pid $PID
	exit 3
fi

EXE_READLINK=`readlink -f "$EXE_LINK" || :`
if [ -z "$EXE_READLINK" ]; then
	>&2 echo unknown pid $PID
	exit 4
fi
if [ "$EXE_READLINK" != "$EXE" ]; then
	>&2 echo pid $PID not file $EXE "(${EXE_READLINK})"
	exit 5
fi

echo $PID
