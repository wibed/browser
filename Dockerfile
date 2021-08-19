FROM alpine:latest
RUN apk add --update ttf-liberation firefox curl
RUN fc-cache -fv
RUN firefox --headless --first-startup & sleep 2
RUN firefox --headless --createprofile browser
RUN curl https://raw.githubusercontent.com/arkenfox/user.js/master/user.js \
    -o /root/.mozilla/firefox/$(ls /root/.mozilla/firefox/|grep browser|head -n1)/user.js
ENTRYPOINT ["firefox", "-p", "browser"]
