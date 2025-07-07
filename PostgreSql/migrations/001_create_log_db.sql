-- Creates a database and user for NLog to store log entries.
-- Adjust the password before executing in production environments.

-- Create dedicated user
CREATE USER nlog_user WITH PASSWORD 'ChangeMe';

-- Create separate database for logs
CREATE DATABASE nlog_logdb;

-- Grant privileges on the new database to the logging user
GRANT ALL PRIVILEGES ON DATABASE nlog_logdb TO nlog_user;

\c nlog_logdb

-- Table storing log entries written by NLog
CREATE TABLE IF NOT EXISTS log (
    id SERIAL PRIMARY KEY,
    logged TIMESTAMPTZ NOT NULL,
    level VARCHAR(50),
    logger VARCHAR(250),
    message TEXT,
    exception TEXT
);

-- Allow the logging user to operate on the log table
GRANT ALL PRIVILEGES ON TABLE log TO nlog_user;
