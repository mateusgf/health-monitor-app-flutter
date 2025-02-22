CREATE TABLE user_goals (
    id SERIAL PRIMARY KEY,
    user_id VARCHAR(29) NOT NULL,
    daily_steps INT NOT NULL DEFAULT 0,
    daily_calories INT NOT NULL DEFAULT 0,
    daily_distance INT NOT NULL DEFAULT 0,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_user_goals_user_id ON user_goals (user_id);
