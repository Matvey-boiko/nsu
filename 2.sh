>server.conf

if [ -n "$SERVER_NAME" ]; then
	echo "SERVER_NAME="$SERVER_NAME"" >> server.conf
else
	export SERVER_NAME="StarCraft"
	echo "SERVER_NAME="$SERVER_NAME"" >> server.conf
fi

if [ -n "$MAX_PLAYERS" ]; then
	echo "MAX_PLAYERS="$MAX_PLAYERS"" >> server.conf
else
	export MAX_PLAYERS=125
	echo "MAX_PLAYERS=$MAX_PLAYERS" >> server.conf
fi

if [ -n "$SPAWN_COORDS" ]; then
	echo "SPAWN_COORDS="$SPAWN_COORDS"" >> server.conf
else
	export SPAWN_COORDS="274 67 -249"
	echo "SPAWN_COORDS="$SPAWN_COORDS"" >> server.conf
fi
cat server.conf

