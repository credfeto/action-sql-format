FROM ubuntu:latest

RUN apt-get update && apt-get install -y moreutils curl unzip mono-complete
RUN curl http://architectshack.com/GetFile.aspx?Page=PoorMansTSqlFormatter\&File=SqlFormatter.1.6.10.zip --output sqlformatter.zip 
RUN unzip sqlformatter.zip *.exe
RUN chmod +x SqlFormatter.exe
COPY config/Sqlformatter.exe.config /SqlFormatter.exe.config
RUN ls
COPY SqlFormatter.exe /SqlFormatter.exe
COPY reformat /reformat

ENTRYPOINT ["/reformat"]
