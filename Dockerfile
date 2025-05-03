FROM alpine

WORKDIR /app

COPY --chmod=750 run.sh /usr/local/bin/run

RUN apk add --no-cache bash curl
