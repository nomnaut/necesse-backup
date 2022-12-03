#!/bin/bash
cd "$(dirname "$0")"
./jre/bin/java -jar Server.jar -nogui \
	-localdir \
	-world SSS \
	-slots 10 \
	-owner "nomnaut" \
	-motd "This server is made possible by poor house." \
	-password "olafspoorhouse" \
	-pausewhenempty 1 \
	-giveclientspower 0 \
	-logging 1 \
	-zipsaves 1 \
	$@
