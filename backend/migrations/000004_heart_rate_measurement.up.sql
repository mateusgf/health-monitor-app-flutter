CREATE TABLE heart_rate_measurements (
    id SERIAL PRIMARY KEY,
    user_id VARCHAR(29) NOT NULL,
    value INT NOT NULL,
    datetime TIMESTAMPTZ NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_heart_rate_measurements_user_id ON heart_rate_measurements (user_id);
CREATE INDEX idx_heart_rate_measurements_datetime ON heart_rate_measurements (datetime);
