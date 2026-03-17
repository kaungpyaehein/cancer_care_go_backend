package handlers

import (
	"net/http"

	"cancer_care_go_backend/internal/data"

	"github.com/gin-gonic/gin"
)

// GetCancers handles GET /api/cancers
func GetCancers(c *gin.Context) {
	lang := c.DefaultQuery("lang", "en")

	var cancers interface{}
	if lang == "mm" {
		cancers = data.GetCancersMM()
	} else {
		cancers = data.GetCancers()
	}

	c.JSON(http.StatusOK, gin.H{
		"success": true,
		"data":    cancers,
	})
}

// GetHospitals handles GET /api/hospitals
func GetHospitals(c *gin.Context) {
	lang := c.DefaultQuery("lang", "en")

	var hospitals interface{}
	if lang == "mm" {
		hospitals = data.GetHospitalsMM()
	} else {
		hospitals = data.GetHospitals()
	}

	c.JSON(http.StatusOK, gin.H{
		"success": true,
		"data":    hospitals,
	})
}

// GetBlogs handles GET /api/blogs
func GetBlogs(c *gin.Context) {
	lang := c.DefaultQuery("lang", "en")

	var blogs interface{}
	if lang == "mm" {
		blogs = data.GetBlogsMM()
	} else {
		blogs = data.GetBlogs()
	}

	c.JSON(http.StatusOK, gin.H{
		"success": true,
		"data":    blogs,
	})
}

// GetTreatments handles GET /api/treatments
func GetTreatments(c *gin.Context) {
	lang := c.DefaultQuery("lang", "en")

	var treatments interface{}
	if lang == "mm" {
		treatments = data.GetTreatmentsMM()
	} else {
		treatments = data.GetTreatments()
	}

	c.JSON(http.StatusOK, gin.H{
		"success": true,
		"data":    treatments,
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
