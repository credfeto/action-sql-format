FROM python:3.12.0-alpine3.17

WORKDIR /app
COPY reformat .
COPY reformat.py .
COPY requirements.txt .
COPY config/Sqlformatter.exe.config /SqlFormatter.exe.config

RUN apk --no-cache add bash moreutils curl unzip mono && \
    curl http://architectshack.com/GetFile.aspx?Page=PoorMansTSqlFormatter%26File=SqlFormatter.1.6.10.zip --output sqlformatter.zip && \
    unzip sqlformatter.zip *.exe -d && \
    chmod +x /SqlFormatter.exe

# pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["/app/reformat"]
