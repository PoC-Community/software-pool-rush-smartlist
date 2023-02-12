package Routes

import (
	"github.com/dgrijalva/jwt-go"
	"github.com/gin-gonic/gin"
	"net/http"
)

type Claims struct {
	Username string `json:"username"`
	jwt.StandardClaims
}

func AuthMiddleware() gin.HandlerFunc {
	return func(c *gin.Context) {
		token := c.GetHeader("Authorization")
		email := c.GetHeader("email")
		if token == "" {
			c.JSON(http.StatusUnauthorized, gin.H{
				"message": "Authorization header is missing",
			})
			c.Abort()
			return
		}
		claims, err := ParseToken(token)
		if err != nil {
			c.JSON(http.StatusUnauthorized, gin.H{
				"message": err.Error(),
			})
			c.Abort()
			return
		}
		if email == "" {
			c.JSON(http.StatusUnauthorized, gin.H{
				"message": "Email header is missing",
			})
			c.Abort()
			return
		}
		if claims.Username != email {
			c.JSON(http.StatusUnauthorized, gin.H{
				"message": "Email header is invalid",
			})
			c.Abort()
			return
		}
		c.Set("claims", claims)
	}
}

func ApplyRoutes(r *gin.Engine) {
	ApplyRegisterRoutes(r)
	ApplyLoginRoutes(r)
	ApplyListsRoutes(r)
	ApplyProductsRoutes(r)
	ApplyOptionsRoutes(r)
}
