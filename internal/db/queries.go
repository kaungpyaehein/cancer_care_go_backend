package db

import (
	"log"

	"cancer_care_go_backend/internal/models"

	"github.com/lib/pq"
)

func GetCancers(lang string) []models.CancerType {
	rows, err := DB.Query(
		`SELECT id, name, description, symptoms, treatments, image_url
		 FROM cancer_types WHERE lang = $1 ORDER BY id`, lang)
	if err != nil {
		log.Printf("Error querying cancer_types: %v", err)
		return []models.CancerType{}
	}
	defer rows.Close()

	var result []models.CancerType
	for rows.Next() {
		var c models.CancerType
		if err := rows.Scan(&c.ID, &c.Name, &c.Description, &c.Symptoms, &c.Treatments, &c.ImageURL); err != nil {
			log.Printf("Error scanning cancer row: %v", err)
			continue
		}
		result = append(result, c)
	}
	return result
}

func GetHospitals(lang string) []models.Hospital {
	rows, err := DB.Query(
		`SELECT id, name, address, phone, description, image_url, rating, specialties
		 FROM hospitals WHERE lang = $1 ORDER BY id`, lang)
	if err != nil {
		log.Printf("Error querying hospitals: %v", err)
		return []models.Hospital{}
	}
	defer rows.Close()

	var result []models.Hospital
	for rows.Next() {
		var h models.Hospital
		if err := rows.Scan(&h.ID, &h.Name, &h.Address, &h.Phone, &h.Description, &h.ImageURL, &h.Rating, pq.Array(&h.Specialties)); err != nil {
			log.Printf("Error scanning hospital row: %v", err)
			continue
		}
		result = append(result, h)
	}
	return result
}

func GetBlogs(lang string) []models.Blog {
	rows, err := DB.Query(
		`SELECT id, title, author, content, image_url, date, category
		 FROM blogs WHERE lang = $1 ORDER BY date DESC`, lang)
	if err != nil {
		log.Printf("Error querying blogs: %v", err)
		return []models.Blog{}
	}
	defer rows.Close()

	var result []models.Blog
	for rows.Next() {
		var b models.Blog
		if err := rows.Scan(&b.ID, &b.Title, &b.Author, &b.Content, &b.ImageURL, &b.Date, &b.Category); err != nil {
			log.Printf("Error scanning blog row: %v", err)
			continue
		}
		result = append(result, b)
	}
	return result
}

func GetTreatments(lang string) []models.Treatment {
	rows, err := DB.Query(
		`SELECT id, name, description, procedure_steps, side_effects, recovery, image_url, applicable_cancers
		 FROM treatments WHERE lang = $1 ORDER BY id`, lang)
	if err != nil {
		log.Printf("Error querying treatments: %v", err)
		return []models.Treatment{}
	}
	defer rows.Close()

	var result []models.Treatment
	for rows.Next() {
		var t models.Treatment
		if err := rows.Scan(&t.ID, &t.Name, &t.Description, &t.Procedure, &t.SideEffects, &t.Recovery, &t.ImageURL, pq.Array(&t.ApplicableCancers)); err != nil {
			log.Printf("Error scanning treatment row: %v", err)
			continue
		}
		result = append(result, t)
	}
	return result
}
