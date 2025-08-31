package controllers

import (
	"encoding/json"
	"health-monitor-app-go-backend/config"
	"health-monitor-app-go-backend/models"
	"net/http"

	"health-monitor-app-go-backend/messaging"

	"github.com/gin-gonic/gin"
	amqp "github.com/streadway/amqp"
)

func CreateHeartRateMeasurement(c *gin.Context) {
	var hr models.HeartRateMeasurement
	if err := c.ShouldBindJSON(&hr); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	body, _ := json.Marshal(hr)
	err := messaging.Channel.Publish(
		"heart_rate_exchange",
		"", // routing key (ignored for fanout)
		false,
		false,
		amqp.Publishing{
			ContentType: "application/json",
			Body:        body,
		},
	)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "failed to publish"})
		return
	}

	c.JSON(http.StatusAccepted, gin.H{"status": "queued"})
}

func CreateHeartRateMeasurementRestful(c *gin.Context) {
	var hr models.HeartRateMeasurement
	if err := c.ShouldBindJSON(&hr); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	if err := config.DB.Create(&hr).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusCreated, hr)
}

func GetLastHeartRateMeasurementByUser(c *gin.Context) {
	userID := c.Query("user_id") // @TODO: replace with Firebase auth extraction
	var hr models.HeartRateMeasurement

	if err := config.DB.Where("user_id = ?", userID).Order("datetime DESC").First(&hr).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Record not found"})
		return
	}

	c.JSON(http.StatusOK, hr)
}

func GetHeartRateMeasurementsByUserAndDateRange(c *gin.Context) {
	userID := c.Query("user_id") // @TODO: replace with Firebase auth extraction
	start := c.Query("start")    // ISO8601 datetime string
	end := c.Query("end")

	var measurements []models.HeartRateMeasurement
	db := config.DB.Where("user_id = ?", userID)

	if start != "" && end != "" {
		db = db.Where("datetime BETWEEN ? AND ?", start, end)
		if err := db.Order("datetime ASC").Find(&measurements).Error; err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		c.JSON(http.StatusOK, measurements)
		return
	}

	var last models.HeartRateMeasurement
	if err := db.Order("datetime DESC").First(&last).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Record not found"})
		return
	}
	c.JSON(http.StatusOK, last)
}

// Get heart rate stats (min, max, avg) and daily aggregates for a user in a given time range.
func GetHeartRateStatsByUser(c *gin.Context) {
	userID := c.Query("user_id") // @TODO: replace with Firebase auth extraction
	start := c.Query("start")
	end := c.Query("end")

	if userID == "" || start == "" || end == "" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "user_id, start and end parameters are required"})
		return
	}

	type GlobalResult struct {
		Min int
		Max int
		Avg float64
	}
	var global GlobalResult

	if err := config.DB.Model(&models.HeartRateMeasurement{}).
		Select("MIN(value) as min, MAX(value) as max, AVG(value) as avg").
		Where("user_id = ? AND datetime BETWEEN ? AND ?", userID, start, end).
		Scan(&global).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	type DailyResult struct {
		Date string  `json:"date"`
		Min  int     `json:"min"`
		Max  int     `json:"max"`
		Avg  float64 `json:"avg"`
	}
	var daily []DailyResult

	if err := config.DB.Model(&models.HeartRateMeasurement{}).
		Select("DATE(datetime) as date, MIN(value) as min, MAX(value) as max, AVG(value) as avg").
		Where("user_id = ? AND datetime BETWEEN ? AND ?", userID, start, end).
		Group("DATE(datetime)").
		Order("DATE(datetime) ASC").
		Scan(&daily).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"user_id": userID,
		"start":   start,
		"end":     end,
		"min":     global.Min,
		"max":     global.Max,
		"avg":     global.Avg,
		"daily":   daily,
	})
}
