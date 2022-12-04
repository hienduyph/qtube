FROM denoland/deno:1.28.3 as builder

ARG GIT_REVISION
ENV DENO_DEPLOYMENT_ID=${GIT_REVISION}

WORKDIR /app

COPY deps.ts import_map.json .
RUN deno cache deps.ts --import-map=./import_map.json

COPY . .

RUN deno cache main.ts --import-map=import_map.json

RUN deno compile  --allow-net --allow-env --allow-read --import-map=./import_map.json main.ts

