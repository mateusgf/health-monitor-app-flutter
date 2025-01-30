package controllers

import (
	"health-monitor-app-go-backend/config"
	"health-monitor-app-go-backend/models"
	"net/http"

	"github.com/gin-gonic/gin"
)

func CreateSleepHistory(c *gin.Context) {
	var sleep models.SleepHistory
	if err := c.ShouldBindJSON(&sleep); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	config.DB.Create(&sleep)
	c.JSON(http.StatusCreated, sleep)
}

func GetAllSleepHistories(c *gin.Context) {
	var sleeps []models.SleepHistory
	config.DB.Find(&sleeps)
	c.JSON(http.StatusOK, sleeps)
}

func GetSleepHistoryByID(c *gin.Context) {
	var sleep models.SleepHistory
	id := c.Param("id")

	if err := config.DB.First(&sleep, id).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Record not found"})
		return
	}
	c.JSON(http.StatusOK, sleep)
}

func UpdateSleepHistory(c *gin.Context) {
	var sleep models.SleepHistory
	id := c.Param("id")

	if err := config.DB.First(&sleep, id).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Record not found"})
		return
	}

	if err := c.ShouldBindJSON(&sleep); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	config.DB.Save(&sleep)
	c.JSON(http.StatusOK, sleep)
}

func DeleteSleepHistory(c *gin.Context) {
	var sleep models.SleepHistory
	id := c.Param("id")

	if err := config.DB.First(&sleep, id).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Record not found"})
		return
	}
	config.DB.Delete(&sleep)
	c.JSON(http.StatusOK, gin.H{"message": "Record deleted"})
}
