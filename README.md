# HomeLab Codebase

This repository demonstrates a very small layered setup using .NET 9.0. The root directory contains the following solutions:

```
/<root>
  /WebApi
  /Domain
  /Infrastructure
  /Application
  /Shared
  /Client
```

`WebApi` exposes the HTTP API and references the `Application`, `Infrastructure`, `Domain` and `Shared` libraries. Each of the library folders contains its own `.sln` file along with a matching `*.Test` project for unit tests.

Common primitives live in the `Shared` project. Open `Shared/Shared.sln` to work with the shared library and its tests.

`Client` contains a small TypeScript application that uses Axios to retrieve the `/weatherforecast` endpoint exposed by `WebApi`.

## Running the Client in Docker

To build and run the frontend in a container, execute the following commands from the `Client` folder:

```bash
docker build -t client .
docker run --rm -p 8080:8080 client
```
