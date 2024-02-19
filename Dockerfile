FROM alpine:3.19

WORKDIR /app
COPY reformat .
COPY reformat.py .
COPY requirements.txt .
COPY config/Sqlformatter.exe.config /SqlFormatter.exe.config

RUN apk --no-cache add bash moreutils unzip && \
    apk add --no-cache mono --repository https://dl-cdn.alpinelinux.org/alpine/edge/testing && \
    apk add --no-cache --virtual=.build-dependencies ca-certificates && \
    cert-sync /etc/ssl/certs/ca-certificates.crt && \
    apk del .build-dependencies \

RUN unzip config/sqlformatter.zip *.exe -d / && \
    chmod +x /SqlFormatter.exe

# pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["/app/reformat"]
