FROM t0twn/start AS build
RUN dra download -a -i -o /usr/local/bin/piping-server-rust nwtgck/piping-server-rust

FROM alpine
COPY --from=build /usr/local/bin/piping-server-rust /usr/local/bin/piping-server-rust
COPY --from=build /usr/local/bin/start /usr/local/bin/start
ENTRYPOINT [ "start", "piping-server-rust"]
