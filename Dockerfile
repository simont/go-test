FROM golang:1.6-onbuild

RUN useradd jenkins --shell /bin/bash --create-home
USER jenkins

EXPOSE 8000
