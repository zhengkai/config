#!/bin/bash

DOMAIN='
soulogic.com
time.sh
9farm.com
ruin.one
ruinone.com
'

TIME=`date '+%s'`

if [ "$TIME" -lt 1535342908 ]; then
	>&2 echo get time error
	exit 1
fi

TIME=$((TIME+86400*15)) # 过期时间 15 天以内

DOMAIN=($DOMAIN)
for D in "${DOMAIN[@]}"
do
	echo -n domain $D ...
	T=`./check-ssl-expire.sh "$D" 443 1`
	if [ "$T" -lt $TIME ]; then
		TITLE="SSL for $D expired"
		CONTENT=`TZ="Asia/Shanghai" date -d "@$T" +'%Y-%m-%d %H:%M:%S'`
		CONTENT="expired in $CONTENT // ~/conf/script/all-domain-ssl.sh"
		echo fail
		>&2 echo $TITLE
		>&2 echo $CONTENT
		~/hide/mailgun/alert.sh "$TITLE" "$CONTENT"
		exit 1
	else
		echo ok
	fi
done
