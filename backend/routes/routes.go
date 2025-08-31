package routes

import (
	"health-monitor-app-go-backend/controllers"
	"health-monitor-app-go-backend/middleware"
	"net/http"

	"github.com/gin-gonic/gin"
)

// @TODO: remove this after auth debugging is complete
func GetUserInfo(c *gin.Context) {
	userID, _ := c.Get("userID")
	email, _ := c.Get("email")

	c.JSON(http.StatusOK, gin.H{
		"message": "Authenticated request",
		"userID":  userID,
		"email":   email,
	})
}

func HealthCheck(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		"success": true,
		"message": "Golang backend is running",
	})
}

func SetupRouter() *gin.Engine {
	middleware.InitFirebase()

	r := gin.Default()

	r.GET("/healthcheck", HealthCheck)

	protected := r.Group("/api")
	protected.Use(middleware.AuthMiddleware())
	{
		protected.GET("/user", GetUserInfo)

		protected.POST("/sleep", controllers.CreateSleepHistory)
		protected.GET("/sleep", controllers.GetAllSleepHistories)
		protected.GET("/sleep/:id", controllers.GetSleepHistoryByID)
		protected.PUT("/sleep/:id", controllers.UpdateSleepHistory)
		protected.DELETE("/sleep/:id", controllers.DeleteSleepHistory)

		protected.POST("/user_goal", controllers.CreateDailyGoal)
		protected.GET("/user_goal", controllers.GetLastDailyGoalByUser)
		protected.GET("/user_goal/:id", controllers.GetDailyGoalByID)
		protected.PUT("/user_goal/:id", controllers.UpdateDailyGoal)
		protected.DELETE("/user_goal/:id", controllers.DeleteDailyGoal)

		protected.POST("/user_daily_data", controllers.CreateDailyData)
		protected.GET("/user_daily_data/:id", controllers.GetDailyDataByID)
		protected.GET("/user_daily_data/user_goal/:user_goal_id", controllers.GetDailyDataByUserGoalID)
		protected.PUT("/user_daily_data/:id", controllers.UpdateDailyData)
		protected.DELETE("/user_daily_data/:id", controllers.DeleteDailyData)

		protected.POST("/heart_rate", controllers.CreateHeartRateMeasurement)
		protected.GET("/heart_rate", controllers.GetLastHeartRateMeasurementByUser)
		protected.GET("/heart_rate/report", controllers.GetHeartRateMeasurementsByUserAndDateRange)
		protected.GET("/heart_rate/stats", controllers.GetHeartRateStatsByUser)

		protected.GET("/training_type", controllers.GetTrainingTypes)

		protected.POST("/training_session", controllers.CreateTrainingSession)
		protected.GET("/training_session", controllers.GetTrainingSessionsByUser)
		protected.GET("/training_session/:id", controllers.GetTrainingSessionByID)
		protected.DELETE("/training_session/:id", controllers.DeleteTrainingSession)
		protected.GET("/training_session/stats", controllers.GetTrainingSessionStatsByUser)
		protected.GET("/training_session/stats_breakdown", controllers.GetTrainingSessionStatsWithBreakdown)
		protected.GET("/training_session/stats_summary", controllers.GetTrainingSessionStatsWithSummary)
		/*
			example response for /training_session/stats_summary
			{
			  "user_id": "abc123",
			  "start": "2025-08-01T00:00:00Z",
			  "end": "2025-08-30T23:59:59Z",
			  "group_by": "day",
			  "global_totals": [
			    { "training_type_id": 1, "training_type_name": "Cardio", "total_duration_minutes": 450 },
			    { "training_type_id": 2, "training_type_name": "Strength", "total_duration_minutes": 320 }
			  ],
			  "breakdown": [
			    { "period": "2025-08-01", "training_type_id": 1, "training_type_name": "Cardio", "total_duration_minutes": 60 },
			    { "period": "2025-08-01", "training_type_id": 2, "training_type_name": "Strength", "total_duration_minutes": 30 },
			    { "period": "2025-08-02", "training_type_id": 1, "training_type_name": "Cardio", "total_duration_minutes": 45 }
			  ]
			}
		*/
		protected.GET("/training_session/stats_last_days", controllers.GetTrainingSessionStatsLastNDays)
		/*
			GET /api/training_session/stats_last_days?user_id=abc123
			GET /api/training_session/stats_last_days?user_id=abc123&training_type_id=1&days=30&group_by=week
			GET /api/training_session/stats_summary?user_id=abc123&start=2025-08-01T00:00:00Z&end=2025-08-30T23:59:59Z&training_type_id=2

			example response for /training_session/stats_last_days
			{
			  "user_id": "abc123",
			  "start": "2025-08-24T00:00:00Z",
			  "end": "2025-08-30T23:59:59Z",
			  "group_by": "day",
			  "global_totals": [
			    { "training_type_id": 1, "training_type_name": "Cardio", "total_duration_minutes": 210 },
			    { "training_type_id": 2, "training_type_name": "Strength", "total_duration_minutes": 120 }
			  ],
			  "breakdown": [
			    { "period": "2025-08-24", "training_type_id": 1, "training_type_name": "Cardio", "total_duration_minutes": 30 },
			    { "period": "2025-08-24", "training_type_id": 2, "training_type_name": "Strength", "total_duration_minutes": 20 }
			  ]
			}
		*/

		// @TODO: remove mocked values once DB is complete
		protected.GET("/sleep_history", func(c *gin.Context) {
			response := []map[string]interface{}{
				{
					"id":                1,
					"start":             "2025-01-27T09:11:34.861230",
					"end":               "2025-01-27 17:11:34.862429",
					"durationInMinutes": 480,
					"score":             85,
				},
				{
					"id":                2,
					"start":             "2025-01-26T17:11:34.862641",
					"end":               "2025-01-27T01:11:34.862716",
					"durationInMinutes": 420,
					"score":             76,
				},
				{
					"id":                3,
					"start":             "2025-01-25T17:11:34.862641",
					"end":               "2025-01-25T01:11:34.862716",
					"durationInMinutes": 410,
					"score":             60,
				},
			}

			c.JSON(200, response)
		})

		// @TODO: remove mocked values once DB is complete
		protected.GET("/sleep_detail/:id", func(c *gin.Context) {
			// id := c.Param("id")

			AWAKE_INDEX := 0
			REM_INDEX := 1
			LIGHT_SLEEP_INDEX := 2
			DEEP_SLEEP_INDEX := 3

			response := []map[string]interface{}{
				{"phase": LIGHT_SLEEP_INDEX, "duration": 20},
				{"phase": AWAKE_INDEX, "duration": 5},
				{"phase": LIGHT_SLEEP_INDEX, "duration": 35},
				{"phase": DEEP_SLEEP_INDEX, "duration": 35},
				{"phase": LIGHT_SLEEP_INDEX, "duration": 25},
				{"phase": REM_INDEX, "duration": 60},
				{"phase": AWAKE_INDEX, "duration": 10},
				{"phase": LIGHT_SLEEP_INDEX, "duration": 110},
				{"phase": AWAKE_INDEX, "duration": 5},
				{"phase": DEEP_SLEEP_INDEX, "duration": 25},
				{"phase": LIGHT_SLEEP_INDEX, "duration": 90},
			}

			c.JSON(200, response)
		})
	}

	return r
}
