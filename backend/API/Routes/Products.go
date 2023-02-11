package Routes

import (
	"Rush/database"
	"github.com/gin-gonic/gin"
)

func getProducts(c *gin.Context) {
	favproducts, err := database.GetFavoriteProducts(c.GetHeader("email"))
	if err != nil {
		c.JSON(500, gin.H{"error": err.Error()})
		return
	}
	c.JSON(200, favproducts)
}

func ApplyProductsRoutes(r *gin.Engine) {
	r.GET("/products", AuthMiddleware(), getProducts)
}
