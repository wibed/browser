# browser limited in memory to prevent host from oomkilling my progress
# dont forget to enable X11 access: xhost +local:root

.PHONY: help build_nc sync run

help:	Makefile 
	sed -n '1,2p' $<

.DEFAULT_GOAL := run

TAGNAME=browser



build_nc: 
	docker build . --no-cache -t ${TAGNAME}

sync:
	docker volume rm ${TAGNAME}Data || true
	docker volume create ${TAGNAME}Data
	docker build . -t ${TAGNAME}

run:
	docker run \
		-itd \
		--network="host" \
		-e DISPLAY="${DISPLAY}" \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v ${TAGNAME}Data:/root \
		--memory=4g \
		--memory-swap=4g \
		${TAGNAME}
