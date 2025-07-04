# HomeLab Codebase

This repository demonstrates a very small layered setup using .NET 9.0. The root directory contains the following solutions:

```
/<root>
  /WebApi
  /Domain
  /Infrastructure
  /Application
  /Shared
```

`WebApi` exposes the HTTP API and references the `Application`, `Infrastructure`, `Domain` and `Shared` libraries. Each of the library folders contains its own `.sln` file along with a matching `*.Test` project for unit tests.

Common primitives live in the `Shared` project. Open `Shared/Shared.sln` to work with the shared library and its tests.
