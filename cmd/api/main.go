package main

import (
	"fmt"
	"log"
	"os"

	"cancer_care_go_backend/internal/handlers"
	"cancer_care_go_backend/internal/middleware"

	"github.com/gin-gonic/gin"
)

func main() {
	// Set Gin mode (release/debug)
	mode := os.Getenv("GIN_MODE")
	if mode == "" {
		mode = "debug"
	}
	gin.SetMode(mode)

	// Create Gin router
	router := gin.Default()

	// Apply middleware
	router.Use(middleware.CORS())

	// API routes
	api := router.Group("/api")
	{
		api.GET("/health", handlers.HealthCheck)
		api.GET("/cancers", handlers.GetCancers)
		api.GET("/hospitals", handlers.GetHospitals)
		api.GET("/blogs", handlers.GetBlogs)
		api.GET("/treatments", handlers.GetTreatments)
	}

	// Get port from environment or use default
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	// Start server
	addr := fmt.Sprintf(":%s", port)
	log.Printf("🚀 Cancer Care API Server starting on http://localhost%s", addr)
	log.Printf("📋 Health check: http://localhost%s/api/health", addr)
	log.Printf("🔬 Cancers endpoint: http://localhost%s/api/cancers", addr)
	log.Printf("🏥 Hospitals endpoint: http://localhost%s/api/hospitals", addr)
	log.Printf("📝 Blogs endpoint: http://localhost%s/api/blogs", addr)
	log.Printf("💊 Treatments endpoint: http://localhost%s/api/treatments", addr)

	if err := router.Run(addr); err != nil {
		log.Fatalf("Failed to start server: %v", err)
	}
}
