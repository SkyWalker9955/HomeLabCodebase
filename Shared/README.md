# Shared Libraries

Common utilities and shared code used across multiple projects.

## Shared solution

`Shared.sln` groups together two projects:

- `Shared` - a .NET class library targeting **net9.0**. All shared primitives
  reside under the `Types` folder of this project (e.g. the `Result` record and
  money abstractions).
- `Shared.Test` - xUnit tests for the library.
