FROM ubuntu:latest

RUN apt-get install nuget moreutils
RUN curl http://architectshack.com/GetFile.aspx?Page=PoorMansTSqlFormatter\&File=SqlFormatter.1.6.10.zip --output sqlformatter.zip 
RUN unzip sqlformatter.zip *.exe -d sqlformatter
RUN chmod +x sqlformatter/SqlFormatter.exe

COPY reformat /reformat

ENTRYPOINT ["/reformat"]
