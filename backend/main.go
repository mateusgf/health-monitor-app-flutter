package main

import (
	"health-monitor-app-go-backend/config"
	"health-monitor-app-go-backend/routes"
	"log"

	"github.com/joho/godotenv"
)

func main() {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	config.InitDB()
	r := routes.SetupRouter()
	r.Run(":8081")
}
