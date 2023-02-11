package main

import (
	"Rush/API/Server"
	"Rush/database"
	"fmt"
)

func main() {
	db := database.InitDatabase()
	fmt.Println("Database started")
	s := Server.NewServer()
	fmt.Printf("server listening on http://%s:%s/", s.Config.Host, s.Config.Port)
	err := s.Engine.Run(s.Config.Host + ":" + s.Config.Port)
	if err != nil {
		errS := fmt.Errorf("error starting server: %s", err)
		fmt.Println(errS)
		return
	}
	err = db.Close()
	if err != nil {
		panic(err)
	}
	return
}
