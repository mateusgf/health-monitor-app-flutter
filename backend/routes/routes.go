package routes

import (
	"health-monitor-app-go-backend/controllers"

	"github.com/gin-gonic/gin"
)

func SetupRouter() *gin.Engine {
	r := gin.Default()

	r.POST("/sleep", controllers.CreateSleepHistory)
	r.GET("/sleep", controllers.GetAllSleepHistories)
	r.GET("/sleep/:id", controllers.GetSleepHistoryByID)
	r.PUT("/sleep/:id", controllers.UpdateSleepHistory)
	r.DELETE("/sleep/:id", controllers.DeleteSleepHistory)

	r.GET("/sleep_history", func(c *gin.Context) {
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

	r.GET("/sleep_detail/:id", func(c *gin.Context) {
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

	return r
}
