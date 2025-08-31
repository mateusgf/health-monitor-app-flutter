package controllers

import (
	"health-monitor-app-go-backend/config"
	"health-monitor-app-go-backend/models"
	"net/http"

	"github.com/gin-gonic/gin"
)

func GetTrainingTypes(c *gin.Context) {
	var types []models.TrainingType
	if err := config.DB.Find(&types).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, types)
}
