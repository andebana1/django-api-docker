# Python support can be specified down to the minor or micro version
# (e.g. 3.6 or 3.6.3).
# OS Support also exists for jessie & stretch (slim and full).
# See https://hub.docker.com/r/library/python/ for all supported Python
# tags from Docker Hub.
FROM python:3.6-alpine
MAINTAINER Anderson Vieira de Lima
# If you prefer miniconda:
#FROM continuumio/miniconda3
ENV PYTHONUNBUFFERED 1

# Using pip:
COPY ./requirements.txt ./requirements.txt
RUN python3 -m pip install -r requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user