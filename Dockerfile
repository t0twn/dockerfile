FROM debian:bookworm-slim AS build

RUN apt update && apt install -y curl && apt clean && rm -rf /var/lib/apt/lists/*
RUN curl --proto '=https' --tlsv1.2 -sSf \
        https://raw.githubusercontent.com/devmatteini/dra/refs/heads/main/install.sh | bash -s -- --to /usr/local/bin/

COPY --chmod=555 start.sh /usr/local/bin/start