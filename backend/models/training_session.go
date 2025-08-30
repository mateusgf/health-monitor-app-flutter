package models

import "time"

type TrainingSession struct {
	ID             uint      `gorm:"primaryKey" json:"id"`
	UserID         string    `gorm:"type:varchar(29);not null" json:"user_id"`
	TrainingTypeID uint      `gorm:"not null" json:"training_type_id"`
	Start          time.Time `gorm:"type:timestamptz;not null" json:"start"`
	End            time.Time `gorm:"type:timestamptz;not null" json:"end"`
	CreatedAt      time.Time `gorm:"autoCreateTime" json:"created_at"`
	UpdatedAt      time.Time `gorm:"autoUpdateTime" json:"updated_at"`

	TrainingType TrainingType `gorm:"foreignKey:TrainingTypeID" json:"training_type"`
}
