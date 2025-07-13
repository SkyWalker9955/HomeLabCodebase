-- Create dedicated user
CREATE USER log_user WITH PASSWORD 'ChangeMe';

-- Create log database
CREATE DATABASE logdb;
GRANT ALL PRIVILEGES ON DATABASE logdb TO log_user;

-- After connecting to logdb manually or in script
-- All tables reside in the default `public` schema

--
-- Lookup Tables
--

-- Providers: identifies external sources of logs
CREATE TABLE IF NOT EXISTS providers (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

-- Log levels: trace, debug, info, etc.
CREATE TABLE IF NOT EXISTS log_levels (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

-- Log sources: replaces separate schemas
CREATE TABLE IF NOT EXISTS sources (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

--
-- Unified Logs Table
--

CREATE TABLE IF NOT EXISTS logs (
    id SERIAL PRIMARY KEY,
    provider_id INT REFERENCES providers(id),
    log_level_id INT REFERENCES log_levels(id),
    source_id INT REFERENCES sources(id),
    logged TIMESTAMPTZ NOT NULL,
    logger VARCHAR(250),
    message TEXT,
    exception TEXT
    );

--
-- Seed Data
--

INSERT INTO log_levels (name) VALUES
    ('Trace'), ('Debug'), ('Info'), ('Warning'), ('Error'), ('Fatal')
    ON CONFLICT (name) DO NOTHING;

INSERT INTO sources (name) VALUES
    ('runtime'), ('startup')
    ON CONFLICT (name) DO NOTHING;

--
-- Indexes
--

CREATE INDEX IF NOT EXISTS idx_logs_logged     ON logs(logged);
CREATE INDEX IF NOT EXISTS idx_logs_level      ON logs(log_level_id);
CREATE INDEX IF NOT EXISTS idx_logs_provider   ON logs(provider_id);
CREATE INDEX IF NOT EXISTS idx_logs_source     ON logs(source_id);

--
-- Privileges
--

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO log_user;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO log_user;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT USAGE, SELECT ON SEQUENCES TO log_user;