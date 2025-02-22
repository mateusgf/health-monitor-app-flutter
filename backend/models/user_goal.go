package models

import "time"

type UserGoal struct {
	ID            uint            `gorm:"primaryKey" json:"id"`
	UserID        string          `gorm:"type:varchar(29);not null" json:"user_id"`
	DailySteps    int             `gorm:"not null;default:0" json:"daily_steps"`
	DailyCalories int             `gorm:"not null;default:0" json:"daily_calories"`
	DailyDistance int             `gorm:"not null;default:0" json:"daily_distance"`
	CreatedAt     time.Time       `gorm:"autoCreateTime" json:"created_at"`
	UpdatedAt     time.Time       `gorm:"autoUpdateTime" json:"updated_at"`
	DailyData     []UserDailyData `gorm:"foreignKey:UserGoalID" json:"daily_data,omitempty"`
}
