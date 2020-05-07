FROM ubuntu:latest

RUN apt-get update && apt-get install -y moreutils curl unzip mono-complete
RUN curl http://architectshack.com/GetFile.aspx?Page=PoorMansTSqlFormatter\&File=SqlFormatter.1.6.10.zip --output sqlformatter.zip 
RUN unzip sqlformatter.zip *.exe -d sqlformatter
RUN ls sqlformatter/
RUN chmod +x sqlformatter/SqlFormatter.exe
COPY config/Sqlformatter.exe.config sqlformatter/SqlFormatter.exe.config
RUN mono -O=all --aot sqlformatter/SqlFormatter.exe

COPY reformat /reformat

ENTRYPOINT ["/reformat"]
