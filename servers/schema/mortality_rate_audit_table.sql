CREATE TABLE mortality_rate_audit (
    audit_id SERIAL PRIMARY KEY,
    operation VARCHAR(10),
    age INT,
    gender VARCHAR(6),
    change_timestamp TIMESTAMP DEFAULT NOW()
);
