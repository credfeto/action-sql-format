FROM python:3.12.0-alpine3.17

WORKDIR /app
COPY reformat .
COPY reformat.py .
COPY requirements.txt .

RUN \
 apk --no-cache add bash moreutils curl unzip mono; \
 pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["/app/reformat"]
