# syntax=docker/dockerfile:1.4
FROM --platform=$BUILDPLATFORM python:3.13-alpine3.21 AS builder

#copy current folder (including /app) into current docker folder
COPY . .

#RUN yum install -y uwsgi which gcc
#RUN apk add uwsgi which gcc
RUN apk add --no-cache uwsgi gcc musl-dev libffi-dev

WORKDIR /app

COPY requirements.txt /app
COPY app.ini /app

RUN --mount=type=cache,target=/root/.cache/pip \
    pip3 install -r requirements.txt

#Run uwsgi with the configuration in the .ini file
CMD ["uwsgi","--ini","app.ini"]

#Expose port 90 of the container to the outside
EXPOSE 90
