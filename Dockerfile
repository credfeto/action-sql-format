FROM ubuntu:latest

RUN apt-get update && apt-get install -y moreutils curl unzip mono-complete
RUN curl http://architectshack.com/GetFile.aspx?Page=PoorMansTSqlFormatter\&File=SqlFormatter.1.6.10.zip --output sqlformatter.zip 
RUN unzip sqlformatter.zip *.exe -d sqlformatter
RUN ls sqlformatter/
RUN chmod +x sqlformatter/SqlFormatter.exe
RUN echo <?xml version="1.0" encoding="utf-8"?>\
<configuration>\
    <startup>\
            <supportedRuntime version="v4.0.30319" />\
            <supportedRuntime version="v4.0"/>\
    </startup> \
</configuration> > sqlformatter/SqlFormatter.exe.config
RUN mono -O=all --aot sqlformatter/SqlFormatter.exe

COPY reformat /reformat

ENTRYPOINT ["/reformat"]
