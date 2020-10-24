FROM alpine:3.12.1

RUN apk --no-cache add moreutils curl unzip mono-complete --no-install-recommends

COPY reformat /reformat

ENTRYPOINT ["/reformat"]
