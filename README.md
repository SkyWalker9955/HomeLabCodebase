# HomeLab Codebase

This repository demonstrates a small layered setup using .NET 9.0. The root directory contains the following solutions:

```
/<root>
  /WebApi
  /Domain
  /Infrastructure
  /Application
  /Shared
  /Client
  /PostgreSql
```

`WebApi` exposes the HTTP API and references the `Application`, `Infrastructure`, `Domain` and `Shared` libraries. Each library folder contains its own `.sln` file along with a matching `*.Test` project for unit tests.

Common primitives live in the `Shared` project. Open `Shared/Shared.sln` to work with the shared library and its tests.

`Client` contains a small TypeScript application that uses Axios to retrieve the `/weatherforecast` endpoint exposed by `WebApi`.

## Running the API

Start the web service from the repository root:

```bash
dotnet run --project WebApi
```

Browse to <http://localhost:5066/swagger> to inspect the API via Swagger UI. Traces and metrics are exported to the console and NLog writes application logs using `Shared/Logging/nlog.config`.

## Database Logging Setup

`PostgreSql/migrations` provides scripts for creating the logging and key vault databases. Apply them with `psql`:

```bash
psql -U postgres -f PostgreSql/migrations/001_create_log_db.sql
psql -U postgres -f PostgreSql/migrations/002_create_keyvault_db.sql
```

## Running the Client

Install dependencies and build the TypeScript project:

```bash
cd Client
npm install
npm run build
npm start
```

Open <http://localhost:8080> to view the client application.

Alternatively the [Client/README.md](Client/README.md) explains how to run it in Docker.
