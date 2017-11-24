#!/bin/bash

(
	cd /opt/steamcmd

	if [ ${USE_BETA} ]
	then
		./steamcmd.sh +login anonymous \
				+force_install_dir ${SERVER_DIRECTORY} \
				+app_update 565060 -beta beta validate \
				+quit
	else
		./steamcmd.sh +login anonymous \
				+force_install_dir ${SERVER_DIRECTORY} \
				+app_update 565060 validate \
				+quit
	fi
)

(
	cd /opt
	cp server/linux64/steamclient.so server/bin/steamclient.so
	cp server/linux64/steamclient.so server/steamclient.so
	cp server/linux64/steamclient.so ./bin/steamclient.so
)

(
	if [ -d ${OVERWRITE_DIRECTORY} ] && [ "$(ls -A ${OVERWRITE_DIRECTORY})" ]
	then
		echo -e "\e[32mFound overwrite files patching ...\e[33m"
		cp -v -r ${OVERWRITE_DIRECTORY}/* ${SERVER_DIRECTORY}/data/
		echo -e "\e[0m"
	fi
)

(
	cd ${SERVER_DIRECTORY}
	./server.sh
)
