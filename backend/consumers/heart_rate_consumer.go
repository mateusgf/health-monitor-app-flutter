package consumers

import (
	"encoding/json"
	"log"

	"health-monitor-app-go-backend/config"
	"health-monitor-app-go-backend/models"

	"github.com/streadway/amqp"
)

func ConsumeHeartRateMeasurements(ch *amqp.Channel) {
	msgs, err := ch.Consume("heart_rate_queue", "", true, false, false, false, nil)
	if err != nil {
		log.Fatal("Failed to register consumer:", err)
	}

	go func() {
		for d := range msgs {
			var hr models.HeartRateMeasurement
			if err := json.Unmarshal(d.Body, &hr); err != nil {
				log.Println("Failed to decode HeartRateMeasurement:", err)
				continue
			}

			if err := config.DB.Create(&hr).Error; err != nil {
				log.Println("Failed to save HeartRateMeasurement:", err)
			} else {
				log.Printf("Stored heart rate: %d for user %s\n", hr.Value, hr.UserID)
			}
		}
	}()
}
