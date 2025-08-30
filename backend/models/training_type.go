package models

import "time"

type TrainingType struct {
	ID        uint              `gorm:"primaryKey" json:"id"`
	Name      string            `gorm:"type:varchar(100);unique;not null" json:"name"`
	CreatedAt time.Time         `gorm:"autoCreateTime" json:"created_at"`
	UpdatedAt time.Time         `gorm:"autoUpdateTime" json:"updated_at"`
	Sessions  []TrainingSession `gorm:"foreignKey:TrainingTypeID" json:"sessions,omitempty"`
}
