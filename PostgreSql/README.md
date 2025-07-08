# PostgreSql Project

This project stores SQL scripts for creating and managing the PostgreSQL databases used by the other services.

- **migrations** – SQL scripts for initializing and evolving the schema.
- **log database script** – `migrations/001_create_log_db.sql` creates the `nlog_logdb` database and `nlog_user` for storing application logs.
- **keyvault script** – `migrations/002_create_keyvault_db.sql` provisions `keyvault_db` and `keyvault_user` and defines encrypted secret storage.

## Applying the Scripts

Run the SQL files using `psql` or another PostgreSQL client. From the repository root:

```bash
psql -U postgres -f PostgreSql/migrations/001_create_log_db.sql
psql -U postgres -f PostgreSql/migrations/002_create_keyvault_db.sql
```

After running the scripts, update the connection strings in `WebApi/appsettings.json` so the API can reach the new databases.
