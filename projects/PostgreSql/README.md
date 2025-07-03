# PostgreSql Project

This project contains all resources related to the PostgreSQL database used across other services. It holds:

- **migrations** – SQL scripts for initializing and evolving the database schema.
- **scripts** – helper scripts for installing PostgreSQL, managing users, and performing backups.

The `scripts/install-postgres.sh` script installs PostgreSQL on Ubuntu 24.04 and creates a default admin user. Environment variables `POSTGRES_USER` and `POSTGRES_PASSWORD` can be supplied to customize the credentials.

## Running with Docker

A `docker-compose.yml` file is provided to quickly start PostgreSQL in a container.
It uses the official `postgres:16` image and mounts the `migrations` directory so
any SQL files are executed on first startup.

```bash
# start in detached mode
POSTGRES_USER=myuser POSTGRES_PASSWORD=secret \
  docker compose -f docker-compose.yml up -d
```

The database will be accessible on port 5432 and persisted in the `pgdata` volume.

