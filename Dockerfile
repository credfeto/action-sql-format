FROM alpine:3.19

WORKDIR /app
COPY reformat .
COPY config/Sqlformatter.exe.config Sqlformatter.exe.config
COPY config/Sqlformatter.exe Sqlformatter.exe

RUN apk --no-cache add bash moreutils && \
    apk add --no-cache mono --repository https://dl-cdn.alpinelinux.org/alpine/edge/testing && \
    apk add --no-cache --virtual=.build-dependencies ca-certificates && \
    cert-sync /etc/ssl/certs/ca-certificates.crt && \
    apk del .build-dependencies && \
    chmod +x Sqlformatter.exe &&

ENTRYPOINT ["/app/reformat"]
