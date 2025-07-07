# Daily quote generator

Go webapp that retrieves random quote from public API.

## Getting started

1. Clone repo
```
git clone https://github.com/rikardoricz/daily-quote-go
```

2. Go to project directory and start the app

```sh
cd daily-quote-go
```

**run without building**
```sh
go run ./cmd/main.go
```

**build and run**
```sh
go build -o bin/app ./cmd && ./bin/app
```

**or build and run container**
```sh
docker build -t daily-quote-go:v0.1 -f build/Dockerfile . && docker run -p 8080:8080 daily-quote-go:v0.1
```

3. Access [http://localhost:8080](http://localhost:8080)in browser

