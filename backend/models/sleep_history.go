package models

import "time"

type SleepHistory struct {
	ID              uint      `json:"id" gorm:"primaryKey;autoIncrement"`
	Start           time.Time `json:"start" gorm:"not null"`
	End             time.Time `json:"end" gorm:"not null"`
	DurationMinutes int       `json:"durationInMinutes" gorm:"not null"`
	Score           int       `json:"score" gorm:"not null"`
}
