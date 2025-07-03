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
  /shared
```

`/projects` holds separately deployable domains. Shared libraries or utilities should reside under `/shared`.
