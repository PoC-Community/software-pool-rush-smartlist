package main

import (
	"Rush/database"
	"fmt"
)

func main() {
	db := database.InitDatabase()
	fmt.Println("Database started")
	err := db.Close()
	if err != nil {
		panic(err)
	}
	return
}
