FROM alpine:3.19

WORKDIR /app
COPY reformat .
COPY reformat.py .
COPY requirements.txt .
COPY config/Sqlformatter.exe.config /SqlFormatter.exe.config

RUN apk --no-cache add bash moreutils curl unzip && \
    apk add --no-cache mono --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing && \
    apk add --no-cache --virtual=.build-dependencies ca-certificates && \
    cert-sync /etc/ssl/certs/ca-certificates.crt && \
    apk del .build-dependencies && \
    curl http://architectshack.com/GetFile.aspx?Page=PoorMansTSqlFormatter%26File=SqlFormatter.1.6.10.zip --output sqlformatter.zip && \
    unzip sqlformatter.zip *.exe -d && \
    chmod +x /SqlFormatter.exe

# pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["/app/reformat"]
