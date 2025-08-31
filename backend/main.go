package main

import (
	"health-monitor-app-go-backend/config"
	"health-monitor-app-go-backend/consumers"
	"health-monitor-app-go-backend/messaging"
	"health-monitor-app-go-backend/routes"
	"log"
	"os"

	"github.com/joho/godotenv"
)

func main() {
	err := godotenv.Load()
	if err != nil {
		useDocker := os.Getenv("DB_USE_DOCKER")
		if useDocker == "true" {
			log.Println("DB_USE_DOCKER = 1, loading docker environment variables")
		} else {
			log.Println("Error loading .env file")
		}
	}

	config.InitDB()

	// RabbitMQ setup
	messaging.InitRabbitMQ()
	consumers.ConsumeHeartRateMeasurements(messaging.Channel)
	consumers.ConsumeUserDailyData(messaging.Channel)

	r := routes.SetupRouter()
	r.Run(":8081")
}
