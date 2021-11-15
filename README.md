# setsolver-web

## Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
SETSOLVER_API_URL="http://192.168.178.52:5000" npm run serve
```



## Docker

### build 
docker build -t setsolver-web .

### run 
docker run -p 8080:8080 --rm -e SETSOLVER_API_URL="http://192.168.178.52:5000" --name setsolver-web setsolver-web
