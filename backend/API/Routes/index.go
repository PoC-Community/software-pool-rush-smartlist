package Routes

import (
	"Rush/API/Middlewares"
	"github.com/dgrijalva/jwt-go"
	"github.com/gin-gonic/gin"
)

type Claims struct {
	Username string `json:"username"`
	jwt.StandardClaims
}

func ApplyRoutes(r *gin.Engine) {
	authorized := r.Group("/")
	authorized.Use(Middlewares.AuthMiddleware())
	ApplyRegisterRoutes(r)
	ApplyLoginRoutes(r)
}
