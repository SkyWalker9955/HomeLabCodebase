#!/bin/bash
set -euo pipefail

# Install PostgreSQL on Ubuntu 24.04 and configure a default admin role.
# Based on instructions from https://www.postgresql.org/docs/current/

# Update package information
sudo apt-get update

# Install PostgreSQL packages
sudo apt-get install -y postgresql postgresql-contrib

# Determine credentials from environment or defaults
DB_USER="${POSTGRES_USER:-admin}"
DB_PASSWORD="${POSTGRES_PASSWORD:-admin}"

# Create the role if it does not already exist
sudo -u postgres psql <<SQL
DO
$$
BEGIN
   IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = '$DB_USER') THEN
      CREATE ROLE $DB_USER WITH LOGIN PASSWORD '$DB_PASSWORD' CREATEDB;
   END IF;
END
$$;
SQL

# Create a database owned by the user if it doesn't exist
sudo -u postgres psql -tAc "SELECT 1 FROM pg_database WHERE datname='$DB_USER'" | grep -q 1 || sudo -u postgres createdb -O "$DB_USER" "$DB_USER"

echo "PostgreSQL installation complete. Default user: $DB_USER"
