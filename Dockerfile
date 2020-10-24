FROM alpine:3.1.2

RUN apk --no-cache add moreutils curl unzip mono-complete --no-install-recommends

COPY reformat /reformat

ENTRYPOINT ["/reformat"]
