package models

import "time"

// CancerType represents a type of cancer with detailed information
type CancerType struct {
	ID          string `json:"id"`
	Name        string `json:"name"`
	Description string `json:"description"`
	Symptoms    string `json:"symptoms"`
	Treatments  string `json:"treatments"`
	ImageURL    string `json:"imageUrl"`
}

// Hospital represents a medical facility
type Hospital struct {
	ID          string   `json:"id"`
	Name        string   `json:"name"`
	Address     string   `json:"address"`
	Phone       string   `json:"phone"`
	Description string   `json:"description"`
	ImageURL    string   `json:"imageUrl"`
	Rating      float64  `json:"rating"`
	Specialties []string `json:"specialties"`
}

// Blog represents a blog post or article
type Blog struct {
	ID       string    `json:"id"`
	Title    string    `json:"title"`
	Author   string    `json:"author"`
	Content  string    `json:"content"`
	ImageURL string    `json:"imageUrl"`
	Date     time.Time `json:"date"`
	Category string    `json:"category"`
}

// Treatment represents a cancer treatment method
type Treatment struct {
	ID                string   `json:"id"`
	Name              string   `json:"name"`
	Description       string   `json:"description"`
	Procedure         string   `json:"procedure"`
	SideEffects       string   `json:"sideEffects"`
	Recovery          string   `json:"recovery"`
	ImageURL          string   `json:"imageUrl"`
	ApplicableCancers []string `json:"applicableCancers"`
}
