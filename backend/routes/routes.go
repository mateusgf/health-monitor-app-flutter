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

func SetupRouter() *gin.Engine {
	middleware.InitFirebase()

	r := gin.Default()

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
