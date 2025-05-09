FROM t0twn/start AS build
RUN dra download -a --install-file frpc -o /usr/local/bin/frpc fatedier/frp

FROM alpine
COPY --from=build /usr/local/bin/frpc /usr/local/bin/frpc
COPY --from=build /usr/local/bin/start /usr/local/bin/start
ENTRYPOINT ["start", "frpc"]
