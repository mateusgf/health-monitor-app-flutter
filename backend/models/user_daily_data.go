package models

import "time"

/*
There will be one entry per user per day.
The device will send data using message queue (RabbitMQ).
and the value will be updated/overwritten throughout the day as new data comes in.
So each DailySteps, DailyCalories, DailyDistance will updated as new data comes in.
For example
{"user_id": "user123", "date": "2025-08-31", "daily_steps": 5000, "daily_calories": 200, "daily_distance": 3.5}
If date entry already exists for user123 on 2023-10-01, it will update the existing entry. If not, it will create a new entry.
*/

type UserDailyData struct {
	ID            uint      `gorm:"primaryKey" json:"id"`
	UserID        string    `gorm:"type:varchar(29);not null" json:"user_id"`
	UserGoalID    uint      `gorm:"not null" json:"user_goal_id"`
	Date          time.Time `gorm:"type:date;not null" json:"date"`
	DailySteps    int       `gorm:"not null;default:0" json:"daily_steps"`
	DailyCalories int       `gorm:"not null;default:0" json:"daily_calories"`
	DailyDistance int       `gorm:"not null;default:0" json:"daily_distance"`
	CreatedAt     time.Time `gorm:"autoCreateTime" json:"created_at"`
	UpdatedAt     time.Time `gorm:"autoUpdateTime" json:"updated_at"`
	UserGoal      UserGoal  `gorm:"foreignKey:UserGoalID" json:"-"`
}
