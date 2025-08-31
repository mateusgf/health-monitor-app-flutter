package models

import "time"

type HeartRateMeasurement struct {
	ID        uint      `gorm:"primaryKey" json:"id"`
	UserID    string    `gorm:"type:varchar(29);not null" json:"user_id"`
	Value     int       `gorm:"not null" json:"value"`
	Datetime  time.Time `gorm:"type:timestamptz;not null" json:"datetime"`
	CreatedAt time.Time `gorm:"autoCreateTime" json:"created_at"`
	UpdatedAt time.Time `gorm:"autoUpdateTime" json:"updated_at"`
}
