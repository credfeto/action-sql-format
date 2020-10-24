FROM alpine:3.12.1

RUN apk --no-cache add moreutils curl unzip mono-complete

COPY reformat /reformat

ENTRYPOINT ["/reformat"]
