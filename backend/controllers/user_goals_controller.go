package controllers

import (
	"health-monitor-app-go-backend/config"
	"health-monitor-app-go-backend/models"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/rs/zerolog/log"
)

func CreateDailyGoal(c *gin.Context) {
	var userGoal models.UserGoal
	if err := c.ShouldBindJSON(&userGoal); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	if err := config.DB.Create(&userGoal).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusCreated, userGoal)
}

func GetLastDailyGoalByUser(c *gin.Context) {
	userID := c.Query("user_id") // @TODO: get user id info from auth token by fetching from firebase
	var userGoal models.UserGoal

	log.Info().Msgf("userID: %s", userID)

	if err := config.DB.Where("user_id = ?", userID).Order("created_at DESC").First(&userGoal).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Record not found"})
		return
	}

	c.JSON(http.StatusOK, userGoal)
}

func GetDailyGoalByID(c *gin.Context) {
	id := c.Param("id")
	var userGoal models.UserGoal

	if err := config.DB.Preload("DailyData").First(&userGoal, id).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Record not found"})
		return
	}

	c.JSON(http.StatusOK, userGoal)
}

func UpdateDailyGoal(c *gin.Context) {
	id := c.Param("id")
	var userGoal models.UserGoal

	if err := config.DB.First(&userGoal, id).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Record not found"})
		return
	}

	if err := c.ShouldBindJSON(&userGoal); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	config.DB.Save(&userGoal)
	c.JSON(http.StatusOK, userGoal)
}

func DeleteDailyGoal(c *gin.Context) {
	id := c.Param("id")
	if err := config.DB.Delete(&models.UserGoal{}, id).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "User goal deleted successfully"})
}
