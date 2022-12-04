# Youtube clone for fun

### Development

```
deno task start
```

## Production Run

```bash
docker build --build-arg GIT_REVISION=$(git rev-parse HEAD) -t quay.io/hienduyph/qtube .
docker run -d --name qtube -p 8000:8000 quay.io/hienduyph/qtube
```

FROM denoland/deno:1.28.3 AS runtime

COPY --from=builder /app/qtube  /qtube

EXPOSE 8000

ENTRYPOINT ["/qtube", "--allow-net", "--allow-env", "--allow-read" ]
