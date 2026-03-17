package handlers

import (
	"net/http"

	"cancer_care_go_backend/internal/db"

	"github.com/gin-gonic/gin"
)

// GetCancers handles GET /api/cancers
func GetCancers(c *gin.Context) {
	lang := c.DefaultQuery("lang", "en")
	c.JSON(http.StatusOK, gin.H{
		"success": true,
		"data":    db.GetCancers(lang),
	})
}

// GetHospitals handles GET /api/hospitals
func GetHospitals(c *gin.Context) {
	lang := c.DefaultQuery("lang", "en")
	c.JSON(http.StatusOK, gin.H{
		"success": true,
		"data":    db.GetHospitals(lang),
	})
}

// GetBlogs handles GET /api/blogs
func GetBlogs(c *gin.Context) {
	lang := c.DefaultQuery("lang", "en")
	c.JSON(http.StatusOK, gin.H{
		"success": true,
		"data":    db.GetBlogs(lang),
	})
}

// GetTreatments handles GET /api/treatments
func GetTreatments(c *gin.Context) {
	lang := c.DefaultQuery("lang", "en")
	c.JSON(http.StatusOK, gin.H{
		"success": true,
		"data":    db.GetTreatments(lang),
	})
}

// HealthCheck handles GET /api/health
func HealthCheck(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		"success": true,
		"message": "Cancer Care API is running",
		"version": "1.0.0",
	})
}
