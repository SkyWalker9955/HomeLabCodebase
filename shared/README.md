# Shared Libraries

Common utilities and shared code used across multiple projects.

## Types library

`Types` is a .NET class library targeting **net9.0**. It currently provides
a simple `Result` record that projects can use to represent success or failure
outcomes. The `shared/Types` folder contains a solution with the library in
`Types/` and unit tests under `Types.Test/`.

## Domain library

`Domain` is a .NET class library intended to hold cross-cutting business logic
that can be shared between projects. The `shared/Domain` folder mirrors the same
structure with the library in `Domain/` and unit tests under `Domain.Test/`.

