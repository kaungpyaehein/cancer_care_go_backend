package main

import (
	"database/sql"
	"fmt"
	"log"
	"os"

	_ "github.com/lib/pq"
)

func main() {
	dsn := os.Getenv("DATABASE_URL")
	if dsn == "" {
		log.Fatal("DATABASE_URL is not set")
	}
	db, err := sql.Open("postgres", dsn)
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	file := "migrations/001_schema.sql"
	if len(os.Args) > 1 {
		file = os.Args[1]
	}
	data, err := os.ReadFile(file)
	if err != nil {
		log.Fatal(err)
	}

	if _, err = db.Exec(string(data)); err != nil {
		log.Fatal(err)
	}
	fmt.Println("Migration completed successfully")
}
