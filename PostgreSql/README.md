# PostgreSql Project

This project contains all resources related to the PostgreSQL database used across other services. It holds:

- **migrations** – SQL scripts for initializing and evolving the database schema.
- **log database script** – `migrations/001_create_log_db.sql` sets up the `nlog_logdb` database and `nlog_user` for storing application logs.
- **keyvault script** – `migrations/002_create_keyvault_db.sql` provisions `keyvault_db` and `keyvault_user` and defines encrypted secret storage.
