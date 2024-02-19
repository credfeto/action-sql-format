FROM python:3.12.0-alpine3.17

WORKDIR /app
COPY reformat .
COPY reformat.py .
COPY requirements.txt .
COPY config/Sqlformatter.exe.config /SqlFormatter.exe.config

RUN apk --no-cache add bash moreutils curl unzip mono-complete
RUN curl http://architectshack.com/GetFile.aspx?Page=PoorMansTSqlFormatter\&File=SqlFormatter.1.6.10.zip --output sqlformatter.zip
RUN unzip sqlformatter.zip *.exe -d /
RUN chmod +x /SqlFormatter.exe

# pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["/app/reformat"]
