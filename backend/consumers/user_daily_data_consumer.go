package consumers

import (
	"encoding/json"
	"log"
	"time"

	"health-monitor-app-go-backend/config"
	"health-monitor-app-go-backend/models"

	"github.com/streadway/amqp"
	"gorm.io/gorm/clause"
)

func ConsumeUserDailyData(ch *amqp.Channel) {
	msgs, err := ch.Consume("user_daily_data_queue", "", true, false, false, false, nil)
	if err != nil {
		log.Fatal("Failed to register consumer:", err)
	}

	go func() {
		for d := range msgs {
			var data models.UserDailyData
			if err := json.Unmarshal(d.Body, &data); err != nil {
				log.Println("Failed to decode UserDailyData:", err)
				continue
			}

			// Remove time part from date
			data.Date = time.Date(data.Date.Year(), data.Date.Month(), data.Date.Day(), 0, 0, 0, 0, time.UTC)

			// Upsert
			if err := config.DB.Clauses(clause.OnConflict{
				Columns:   []clause.Column{{Name: "user_id"}, {Name: "date"}},
				DoUpdates: clause.AssignmentColumns([]string{"daily_steps", "daily_calories", "daily_distance", "updated_at"}),
			}).Create(&data).Error; err != nil {
				log.Println("Error saving UserDailyData:", err)
			}
		}
	}()
}
