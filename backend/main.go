package main

import (
	"health-monitor-app-go-backend/config"
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
	r := routes.SetupRouter()
	r.Run(":8081")
}
