-- Creates a keyvault database and dedicated user for managing application secrets.
-- Adjust the passwords and encryption key placeholders before using in production.

-- Create dedicated user for keyvault
CREATE USER keyvault_user WITH PASSWORD 'ChangeMe';

-- Create keyvault database
CREATE DATABASE keyvault_db;

-- Grant privileges on the new database to the keyvault user
GRANT ALL PRIVILEGES ON DATABASE keyvault_db TO keyvault_user;

\c keyvault_db

-- Enable pgcrypto extension for encryption capabilities
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Table storing encrypted secrets
CREATE TABLE IF NOT EXISTS secrets (
    name TEXT PRIMARY KEY,
    type TEXT NOT NULL,
    value BYTEA NOT NULL
);

-- Function to insert an encrypted secret
CREATE OR REPLACE FUNCTION insert_secret(p_name TEXT, p_type TEXT, p_value TEXT, p_key TEXT)
RETURNS VOID AS $$
INSERT INTO secrets(name, type, value)
VALUES (p_name, p_type, pgp_sym_encrypt(p_value, p_key))
ON CONFLICT (name) DO UPDATE SET type = EXCLUDED.type, value = EXCLUDED.value;
$$ LANGUAGE SQL SECURITY DEFINER;

-- Function to retrieve and decrypt a secret
CREATE OR REPLACE FUNCTION get_secret(p_name TEXT, p_key TEXT)
RETURNS TABLE(name TEXT, type TEXT, value TEXT) AS $$
SELECT name, type, pgp_sym_decrypt(value, p_key)::TEXT FROM secrets WHERE name = p_name;
$$ LANGUAGE SQL SECURITY DEFINER;

-- Restrict direct table access to the keyvault_user only
REVOKE ALL ON TABLE secrets FROM PUBLIC;
GRANT ALL PRIVILEGES ON TABLE secrets TO keyvault_user;
