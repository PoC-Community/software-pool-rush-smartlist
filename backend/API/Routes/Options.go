package Routes

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func options(c *gin.Context) {
	c.String(http.StatusNoContent, "")
}

func ApplyOptionsRoutes(r *gin.Engine) {
	r.OPTIONS("/login", options)
	r.OPTIONS("/register", options)
	r.OPTIONS("/lists", options)
	r.OPTIONS("/lists/:list", options)
	r.OPTIONS("/products", options)
	r.OPTIONS("/shops", options)
	r.OPTIONS("/shops/:shop", options)
}
