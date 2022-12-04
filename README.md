# Youtube clone for fun

## Get started

```bash
docker run -d --name qtube -p 8000:8000 ghcr.io/hienduyph/qtube:main
```

### Development

```
deno task start
```

## Production Build

```bash
docker build --build-arg GIT_REVISION=$(git rev-parse HEAD) -t qtube .
docker run -d --name qtube -p 8000:8000 qtube
```

