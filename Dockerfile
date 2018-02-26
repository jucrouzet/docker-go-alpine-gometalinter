FROM golang:1.10-alpine

LABEL                   \
   version="1.10"       \
   maintainer="Julien CROUZET <contact@juliencrouzet.fr>"

RUN                     \
    apk add --update    \
        curl            \
        git             \
        make            \
        &&              \
        mkdir /build

ADD Makefile /build

RUN make -f /build/Makefile all
