FROM debian:12.8-slim AS package-retrieval
ARG VERSION=3.7

# We don't need to pin the version of curl, it's OK to use the latest in this context and to instal the required
# dependencies it needs
# hadolint ignore=DL3008,DL3015
RUN apt-get update && apt-get install curl -y
RUN curl https://flamenco.blender.org/downloads/flamenco-${VERSION}-linux-amd64.tar.gz > /tmp/flamenco.tar.gz
RUN mkdir -p /flamenco && tar -zxvf /tmp/flamenco.tar.gz -C /flamenco
RUN mv /flamenco/flamenco-${VERSION}-linux-amd64 /flamenco/flamenco-linux-amd64

FROM scratch

COPY --from=package-retrieval /flamenco/flamenco-linux-amd64 /flamenco
WORKDIR /flamenco

COPY ./flamenco-manager.yaml ./flamenco-manager.yaml

EXPOSE 8080

CMD ["./flamenco-manager"]