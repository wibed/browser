FROM alpine:latest

#RUN addgroup -g 1001 user
#RUN adduser -D -G user -G video -u 1001 -s /bin/bash user


RUN apk add --update \
    ttf-liberation \
    firefox \
    curl
#    pciutils-dev \
#    mesa-dev \
#    mesa-egl \
#    mesa-gles

RUN fc-cache -fv

#USER user
RUN firefox --headless --first-startup & sleep 2
RUN firefox --headless --createprofile browser
RUN curl https://raw.githubusercontent.com/arkenfox/user.js/master/user.js \
    -o /root/.mozilla/firefox/$(ls /root/.mozilla/firefox/|grep browser|head -n1)/user.js

ENTRYPOINT ["firefox", "-p", "browser"]
