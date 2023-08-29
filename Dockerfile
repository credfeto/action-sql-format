FROM python:3.11.5-alpine3.17

WORKDIR /app
COPY reformat .
COPY reformat.py .
COPY requirements.txt .

RUN \
 apk --no-cache add bash; \
 pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["/app/reformat"]
