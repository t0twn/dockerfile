FROM alpine

WORKDIR /app

COPY run.sh .

RUN chmod 750 run.sh
RUN apk add --no-cache bash curl
