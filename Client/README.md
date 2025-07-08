# Client Application

A small TypeScript frontend that calls the `WebApi` weather endpoint using Axios.

## Building and Running Locally

Install dependencies and compile the sources:

```bash
npm install
npm run build
```

Start a local web server on port **8080**:

```bash
npm start
```

Navigate to <http://localhost:8080> to view the app.

## Running in Docker

The `Dockerfile` builds and serves the compiled files. From the `Client` directory execute:

```bash
docker build -t client .
docker run --rm -p 8080:8080 client
```
