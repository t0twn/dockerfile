FROM t0twn/start AS build
RUN dra download -a -i -o /usr/local/bin/qbittorrent-nox c0re100/qBittorrent-Enhanced-Edition

FROM alpine
COPY --from=build /usr/local/bin/qbittorrent-nox /usr/local/bin/qbittorrent-nox
COPY --from=build /usr/local/bin/start /usr/local/bin/start
ENTRYPOINT ["start", "qbittorrent-nox"]
