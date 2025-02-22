package models

import "time"

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
