# Shared Libraries

Common utilities and shared code used across multiple projects.

## Shared solution

`Shared.sln` groups two projects:

- `Shared` - a .NET class library targeting **net9.0**. Primitives live under `Types` and logging configuration under `Logging`.
- `Shared.Test` - xUnit tests for the library.

The `Logging/nlog.config` file defines console logging and is linked into the `WebApi` project.
