CREATE TABLE training_types (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE training_sessions (
    id SERIAL PRIMARY KEY,
    user_id VARCHAR(29) NOT NULL,
    training_type_id INT NOT NULL,
    start TIMESTAMPTZ NOT NULL,
    "end" TIMESTAMPTZ NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (training_type_id) REFERENCES training_types(id)
);

CREATE INDEX idx_training_sessions_user_id ON training_sessions (user_id);
CREATE INDEX idx_training_sessions_training_type_id ON training_sessions (training_type_id);
CREATE INDEX idx_training_sessions_start ON training_sessions (start);
