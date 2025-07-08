# WebApi Service

This project hosts the HTTP API for the HomeLab sample. It exposes a single `/weatherforecast` endpoint and is instrumented with OpenTelemetry and NLog.

## Running

Execute the API directly from the repository root:

```bash
dotnet run --project WebApi
```

By default the application listens on **http://localhost:5066**. Open <http://localhost:5066/swagger> to explore the Swagger UI.

Traces and metrics are exported to the console. Application logs are produced through NLog using `Shared/Logging/nlog.config`.

## Tests

The `WebApi.sln` groups the API project and its `WebApi.Test` unit tests. Run tests with:

```bash
dotnet test WebApi/WebApi.sln
```
