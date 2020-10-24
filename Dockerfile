FROM alpine:3.12.1

RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk --no-cache add moreutils curl unzip mono@testing

COPY reformat /reformat

ENTRYPOINT ["/reformat"]
