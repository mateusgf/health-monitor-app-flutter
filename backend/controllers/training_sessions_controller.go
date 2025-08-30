package controllers

import (
	"fmt"
	"health-monitor-app-go-backend/config"
	"health-monitor-app-go-backend/models"
	"net/http"
	"strconv"
	"time"

	"github.com/gin-gonic/gin"
)

func CreateTrainingSession(c *gin.Context) {
	var s models.TrainingSession
	if err := c.ShouldBindJSON(&s); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	if err := config.DB.Create(&s).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusCreated, s)
}

func GetTrainingSessionsByUser(c *gin.Context) {
	userID := c.Query("user_id") // @TODO: replace with Firebase auth extraction
	var sessions []models.TrainingSession
	if err := config.DB.Preload("TrainingType").
		Where("user_id = ?", userID).
		Order("start DESC").
		Find(&sessions).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, sessions)
}

func GetTrainingSessionByID(c *gin.Context) {
	id := c.Param("id")
	var s models.TrainingSession
	if err := config.DB.Preload("TrainingType").First(&s, id).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Record not found"})
		return
	}
	c.JSON(http.StatusOK, s)
}

func DeleteTrainingSession(c *gin.Context) {
	id := c.Param("id")
	if err := config.DB.Delete(&models.TrainingSession{}, id).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, gin.H{"message": "Training session deleted successfully"})
}

// Get training session stats (total duration per type, optionally grouped by day)
func GetTrainingSessionStatsByUser(c *gin.Context) {
	userID := c.Query("user_id") // @TODO: replace with Firebase auth extraction
	start := c.Query("start")
	end := c.Query("end")

	if userID == "" || start == "" || end == "" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "user_id, start and end parameters are required"})
		return
	}

	type StatsResult struct {
		TrainingTypeID   uint    `json:"training_type_id"`
		TrainingTypeName string  `json:"training_type_name"`
		TotalDurationMin float64 `json:"total_duration_minutes"`
	}

	var stats []StatsResult
	if err := config.DB.Model(&models.TrainingSession{}).
		Select("training_type_id, training_types.name as training_type_name, SUM(EXTRACT(EPOCH FROM (\"end\" - start)) / 60) as total_duration_min").
		Joins("JOIN training_types ON training_types.id = training_sessions.training_type_id").
		Where("user_id = ? AND start BETWEEN ? AND ?", userID, start, end).
		Group("training_type_id, training_types.name").
		Order("training_type_name ASC").
		Scan(&stats).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"user_id": userID,
		"start":   start,
		"end":     end,
		"stats":   stats,
	})
}

// Get training session stats with daily or weekly breakdown
func GetTrainingSessionStatsWithBreakdown(c *gin.Context) {
	userID := c.Query("user_id") // @TODO: replace with Firebase auth extraction
	start := c.Query("start")
	end := c.Query("end")
	groupBy := c.DefaultQuery("group_by", "day") // "day" or "week"

	if userID == "" || start == "" || end == "" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "user_id, start and end parameters are required"})
		return
	}

	type Stat struct {
		TrainingTypeID   uint    `json:"training_type_id"`
		TrainingTypeName string  `json:"training_type_name"`
		Period           string  `json:"period"` // date or week
		TotalDurationMin float64 `json:"total_duration_minutes"`
	}

	var stats []Stat
	periodExpr := "DATE(start)" // default: daily

	if groupBy == "week" {
		// ISO week: returns e.g., "2025-W35"
		periodExpr = "TO_CHAR(start, 'IYYY-IW')"
	}

	if err := config.DB.Model(&models.TrainingSession{}).
		Select(periodExpr+" as period, training_type_id, training_types.name as training_type_name, SUM(EXTRACT(EPOCH FROM (\"end\" - start)) / 60) as total_duration_min").
		Joins("JOIN training_types ON training_types.id = training_sessions.training_type_id").
		Where("user_id = ? AND start BETWEEN ? AND ?", userID, start, end).
		Group("period, training_type_id, training_types.name").
		Order("period ASC, training_type_name ASC").
		Scan(&stats).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"user_id":  userID,
		"start":    start,
		"end":      end,
		"group_by": groupBy,
		"stats":    stats,
	})
}

// Get training session stats with daily/weekly breakdown and global totals
func GetTrainingSessionStatsWithSummary(c *gin.Context) {
	userID := c.Query("user_id") // @TODO: replace with Firebase auth extraction
	start := c.Query("start")
	end := c.Query("end")
	groupBy := c.DefaultQuery("group_by", "day")  // "day" or "week"
	trainingTypeID := c.Query("training_type_id") // optional

	if userID == "" || start == "" || end == "" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "user_id, start and end parameters are required"})
		return
	}

	dbQuery := config.DB.Model(&models.TrainingSession{}).
		Joins("JOIN training_types ON training_types.id = training_sessions.training_type_id").
		Where("user_id = ? AND start BETWEEN ? AND ?", userID, start, end)

	if trainingTypeID != "" {
		dbQuery = dbQuery.Where("training_type_id = ?", trainingTypeID)
	}

	periodExpr := "DATE(start)"
	if groupBy == "week" {
		periodExpr = "TO_CHAR(start, 'IYYY-IW')"
	}

	type Stat struct {
		TrainingTypeID   uint    `json:"training_type_id"`
		TrainingTypeName string  `json:"training_type_name"`
		Period           string  `json:"period"`
		TotalDurationMin float64 `json:"total_duration_minutes"`
	}
	var stats []Stat
	if err := dbQuery.
		Select(periodExpr + " as period, training_type_id, training_types.name as training_type_name, SUM(EXTRACT(EPOCH FROM (\"end\" - start)) / 60) as total_duration_min").
		Group("period, training_type_id, training_types.name").
		Order("period ASC, training_type_name ASC").
		Scan(&stats).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	type GlobalStat struct {
		TrainingTypeID   uint    `json:"training_type_id"`
		TrainingTypeName string  `json:"training_type_name"`
		TotalDurationMin float64 `json:"total_duration_minutes"`
	}
	var global []GlobalStat
	if err := dbQuery.
		Select("training_type_id, training_types.name as training_type_name, SUM(EXTRACT(EPOCH FROM (\"end\" - start)) / 60) as total_duration_min").
		Group("training_type_id, training_types.name").
		Order("training_type_name ASC").
		Scan(&global).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"user_id":          userID,
		"start":            start,
		"end":              end,
		"group_by":         groupBy,
		"training_type_id": trainingTypeID,
		"global_totals":    global,
		"breakdown":        stats,
	})
}

// Get training session stats for the last N days (default 7) with breakdown and global totals
func GetTrainingSessionStatsLastNDays(c *gin.Context) {
	userID := c.Query("user_id")                 // @TODO: replace with Firebase auth extraction
	daysQuery := c.DefaultQuery("days", "7")     // default: last 7 days
	groupBy := c.DefaultQuery("group_by", "day") // "day" or "week"

	if userID == "" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "user_id parameter is required"})
		return
	}

	days, err := strconv.Atoi(daysQuery)
	if err != nil || days <= 0 {
		c.JSON(http.StatusBadRequest, gin.H{"error": "days must be a positive integer"})
		return
	}

	end := time.Now().UTC()
	start := end.AddDate(0, 0, -days+1) // last N days including today
	c.Request.URL.RawQuery = fmt.Sprintf("user_id=%s&start=%s&end=%s&group_by=%s",
		userID, start.Format(time.RFC3339), end.Format(time.RFC3339), groupBy)

	GetTrainingSessionStatsWithSummary(c)
}
