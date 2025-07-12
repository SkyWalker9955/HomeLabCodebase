-- Creates general purpose log databases and a dedicated user.
-- Adjust the password before executing in production environments.

-- Create dedicated user
CREATE USER log_user WITH PASSWORD 'ChangeMe';

-- Databases for runtime and startup logs
CREATE DATABASE logdb;
CREATE DATABASE startup_logdb;

GRANT ALL PRIVILEGES ON DATABASE logdb TO log_user;
GRANT ALL PRIVILEGES ON DATABASE startup_logdb TO log_user;

\c logdb

-- Store log providers
CREATE TABLE IF NOT EXISTS providers (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

-- Log tables by level
CREATE TABLE IF NOT EXISTS traces (
    id SERIAL PRIMARY KEY,
    provider_id INT REFERENCES providers(id),
    logged TIMESTAMPTZ NOT NULL,
    logger VARCHAR(250),
    message TEXT,
    exception TEXT
);

CREATE TABLE IF NOT EXISTS debugs (
    id SERIAL PRIMARY KEY,
    provider_id INT REFERENCES providers(id),
    logged TIMESTAMPTZ NOT NULL,
    logger VARCHAR(250),
    message TEXT,
    exception TEXT
);

CREATE TABLE IF NOT EXISTS infos (
    id SERIAL PRIMARY KEY,
    provider_id INT REFERENCES providers(id),
    logged TIMESTAMPTZ NOT NULL,
    logger VARCHAR(250),
    message TEXT,
    exception TEXT
);

CREATE TABLE IF NOT EXISTS warnings (
    id SERIAL PRIMARY KEY,
    provider_id INT REFERENCES providers(id),
    logged TIMESTAMPTZ NOT NULL,
    logger VARCHAR(250),
    message TEXT,
    exception TEXT
);

CREATE TABLE IF NOT EXISTS errors (
    id SERIAL PRIMARY KEY,
    provider_id INT REFERENCES providers(id),
    logged TIMESTAMPTZ NOT NULL,
    logger VARCHAR(250),
    message TEXT,
    exception TEXT
);

CREATE TABLE IF NOT EXISTS fatals (
    id SERIAL PRIMARY KEY,
    provider_id INT REFERENCES providers(id),
    logged TIMESTAMPTZ NOT NULL,
    logger VARCHAR(250),
    message TEXT,
    exception TEXT
);

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO log_user;

--
-- Startup log database
--
\c startup_logdb

CREATE TABLE IF NOT EXISTS providers (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS traces (
    id SERIAL PRIMARY KEY,
    provider_id INT REFERENCES providers(id),
    logged TIMESTAMPTZ NOT NULL,
    logger VARCHAR(250),
    message TEXT,
    exception TEXT
);

CREATE TABLE IF NOT EXISTS debugs (
    id SERIAL PRIMARY KEY,
    provider_id INT REFERENCES providers(id),
    logged TIMESTAMPTZ NOT NULL,
    logger VARCHAR(250),
    message TEXT,
    exception TEXT
);

CREATE TABLE IF NOT EXISTS infos (
    id SERIAL PRIMARY KEY,
    provider_id INT REFERENCES providers(id),
    logged TIMESTAMPTZ NOT NULL,
    logger VARCHAR(250),
    message TEXT,
    exception TEXT
);

CREATE TABLE IF NOT EXISTS warnings (
    id SERIAL PRIMARY KEY,
    provider_id INT REFERENCES providers(id),
    logged TIMESTAMPTZ NOT NULL,
    logger VARCHAR(250),
    message TEXT,
    exception TEXT
);

CREATE TABLE IF NOT EXISTS errors (
    id SERIAL PRIMARY KEY,
    provider_id INT REFERENCES providers(id),
    logged TIMESTAMPTZ NOT NULL,
    logger VARCHAR(250),
    message TEXT,
    exception TEXT
);

CREATE TABLE IF NOT EXISTS fatals (
    id SERIAL PRIMARY KEY,
    provider_id INT REFERENCES providers(id),
    logged TIMESTAMPTZ NOT NULL,
    logger VARCHAR(250),
    message TEXT,
    exception TEXT
);

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO log_user;
