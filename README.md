# Youtube clone for fun

### Development

```
deno task start
```

## Production Run

```bash
docker build --build-arg GIT_REVISION=$(git rev-parse HEAD) -t qtube .
docker run -d --name qtube -p 8000:8000 qtube
```

