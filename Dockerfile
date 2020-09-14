FROM ubuntu:latest

RUN apt-get update 
RUN apt-get install -y moreutils curl unzip mono-complete --no-install-recommends
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

COPY reformat /reformat

ENTRYPOINT ["/reformat"]
