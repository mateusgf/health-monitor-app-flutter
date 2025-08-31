CREATE UNIQUE INDEX idx_user_daily_data_user_date 
ON user_daily_data(user_id, date);
