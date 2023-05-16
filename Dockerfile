FROM python:3.11.3-alpine3.17

WORKDIR /app

RUN apk --no-cache add bash

USER nobody

COPY reformat .
COPY reformat.py .
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt


ENTRYPOINT ["/app/reformat"]
