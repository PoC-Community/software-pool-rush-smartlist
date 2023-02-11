package main

import (
	"Rush/database"
	"fmt"
)

func main() {
	db := database.InitDatabase()
	fmt.Println("Database started")
	database.DeleteDB()
	err := db.Close()
	if err != nil {
		panic(err)
	}
	return
}
