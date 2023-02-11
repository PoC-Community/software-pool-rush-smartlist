package Server

import (
	"Rush/API/Routes"
	"github.com/gin-gonic/gin"
)

type Server struct {
	*gin.Engine
	Config Spec
}

func NewServer() *Server {
	r := gin.Default()
	config := GetConfig()
	Routes.ApplyRoutes(r)
	return &Server{Engine: r, Config: config}
}
