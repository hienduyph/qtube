FROM docker.io/denoland/deno:1.29.1

ARG GIT_REVISION
ENV DENO_DEPLOYMENT_ID=${GIT_REVISION}

WORKDIR /app

COPY deps.ts import_map.json .
RUN deno cache deps.ts --import-map=./import_map.json

COPY . .

RUN deno cache main.ts --import-map=import_map.json

EXPOSE 8080

CMD ["run", "--allow-net", "--allow-env", "--allow-read", "--allow-write", "--allow-run", "main.ts"]

