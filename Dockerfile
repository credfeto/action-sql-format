FROM ubuntu:latest

RUN apt-get update \
    && apt-get install -y moreutils curl unzip mono-complete --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY reformat /reformat

ENTRYPOINT ["/reformat"]
