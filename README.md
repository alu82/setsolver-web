# setsolver-web

## Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
npm run serve
```

### Compiles and minifies for production
```
npm run build
```

### Lints and fixes files
```
npm run lint
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).

## Docker

### build 
docker build -t setsolver-web .

### run 
docker run -p 8080:8080 --rm -e SETSOLVER_API_URL="http://192.168.178.52:5000/" --name setsolver-web setsolver-web
