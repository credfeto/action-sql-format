FROM python:3.11.3-alpine3.17

RUN apk --no-cache add bash

COPY reformat /reformat
COPY reformat.py /reformat.py
COPY requirements.txt /requirements.txt

RUN pip install -r requirements.txt

ENTRYPOINT ["/reformat"]
