CREATE TABLE user_daily_data (
    id SERIAL PRIMARY KEY,
    user_id VARCHAR(29) NOT NULL,
    user_goal_id INT NOT NULL,
    date DATE NOT NULL,
    daily_steps INT NOT NULL DEFAULT 0,
    daily_calories INT NOT NULL DEFAULT 0,
    daily_distance INT NOT NULL DEFAULT 0,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    UNIQUE(user_id, date),
    FOREIGN KEY (user_goal_id) REFERENCES user_goals(id)
);

CREATE INDEX idx_user_daily_data_user_id ON user_daily_data (user_id);
CREATE INDEX idx_user_daily_data_user_goal_id ON user_daily_data (user_goal_id);
