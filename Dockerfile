FROM alpine:3.14.0

RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk --no-cache add bash moreutils curl unzip mono@testing

COPY reformat /reformat

ENTRYPOINT ["/reformat"]
