package controllers

import (
	"health-monitor-app-go-backend/config"
	"health-monitor-app-go-backend/models"
	"net/http"

	"github.com/gin-gonic/gin"
)

func CreateDailyData(c *gin.Context) {
	var dailyData models.UserDailyData
	if err := c.ShouldBindJSON(&dailyData); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	if err := config.DB.Create(&dailyData).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusCreated, dailyData)
}

func GetDailyDataByID(c *gin.Context) {
	id := c.Param("id")
	var dailyData models.UserDailyData

	if err := config.DB.First(&dailyData, id).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Record not found"})
		return
	}

	c.JSON(http.StatusOK, dailyData)
}

func GetDailyDataByUserGoalID(c *gin.Context) {
	userGoalID := c.Param("user_goal_id")
	var dailyData []models.UserDailyData

	if err := config.DB.Where("user_goal_id = ?", userGoalID).Find(&dailyData).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Records not found"})
		return
	}

	c.JSON(http.StatusOK, dailyData)
}

func UpdateDailyData(c *gin.Context) {
	id := c.Param("id")
	var dailyData models.UserDailyData

	if err := config.DB.First(&dailyData, id).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Record not found"})
		return
	}

	if err := c.ShouldBindJSON(&dailyData); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	config.DB.Save(&dailyData)
	c.JSON(http.StatusOK, dailyData)
}

func DeleteDailyData(c *gin.Context) {
	id := c.Param("id")
	if err := config.DB.Delete(&models.UserDailyData{}, id).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Daily data deleted successfully"})
}
