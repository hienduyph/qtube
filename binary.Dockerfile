FROM docker.io/denoland/deno:debian-1.28.3 as builder

ARG GIT_REVISION
ENV DENO_DEPLOYMENT_ID=${GIT_REVISION}

WORKDIR /app

COPY deps.ts import_map.json .
RUN deno cache deps.ts --import-map=./import_map.json

COPY . .

RUN deno cache main.ts --import-map=import_map.json

# Wait for deno fresh supports compile
# https://github.com/denoland/fresh/issues/785
RUN deno compile  --allow-net --allow-env --allow-read --import-map=./import_map.json -o qtube main.ts


FROM docker.io/debian:11.5 AS runtime

COPY --from=builder /app/qtube  /qtube

EXPOSE 8000

ENTRYPOINT ["/qtube"]
