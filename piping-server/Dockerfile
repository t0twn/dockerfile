FROM t0twn/run AS build
RUN dra download -a -i -o /usr/local/bin/piping-server-rust nwtgck/piping-server-rust

FROM alpine
COPY --from=build /usr/local/bin/piping-server-rust /usr/local/bin/piping-server-rust
COPY --from=build /usr/local/bin/run /usr/local/bin/run
CMD ["run", "piping-server-rust"]
