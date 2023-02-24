FROM alpine:3.17.2

RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    apk --no-cache add bash moreutils curl unzip mono@testing

COPY reformat /reformat

ENTRYPOINT ["/reformat"]
