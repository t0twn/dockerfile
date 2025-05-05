FROM t0twn/start AS build
RUN dra download -a --install-file frps -o /usr/local/bin/frps fatedier/frp

FROM alpine
COPY --from=build /usr/local/bin/frps /usr/local/bin/frps
COPY --from=build /usr/local/bin/start /usr/local/bin/start
ENTRYPOINT ["start", "frps"]
