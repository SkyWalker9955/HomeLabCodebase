# HomeLab Codebase

This repository contains multiple projects organized using Domain-Driven Design (DDD) principles.
Each project is self-contained and can be deployed independently.

```
/<root>
  /projects
    /project-a
      /domain
      /application
      /infrastructure
      /interface
      /tests
      Dockerfile
      /deploy
    /project-b
      ...
    /PostgreSql
      /migrations
      /scripts
  /shared
```

`/projects` holds separately deployable domains. Shared libraries or utilities should reside under `/shared`.

Each project has its own *.sln solution within its folder, including shared libraries.

Common code lives under the `shared` solution. Open `shared/Shared.sln` to work
with the `Shared` library and its tests. The `Shared` project exposes a
`Types` folder that provides reusable primitives.

The `PostgreSql` project stores database migrations and scripts such as
`install-postgres.sh` for installing PostgreSQL on Ubuntu.
A docker-compose file allows running PostgreSQL in a container.


