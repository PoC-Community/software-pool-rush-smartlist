package Routes

import (
	"Rush/database"
	"github.com/gin-gonic/gin"
	"net/http"
)

type newListRequest struct {
	Name string `json:"name" binding:"required"`
	List string `json:"list" binding:"required"`
	Shop string `json:"shop" binding:"required"`
}

func listget(c *gin.Context) {
	listName := c.Param("list")
	dblist, err := database.GetUserList(c.GetHeader("email"), listName)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, dblist)
}

func listpost(c *gin.Context) {
	var listupdate newListRequest
	if err := c.ShouldBindJSON(&listupdate); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	dblist, err := database.GetUserList(c.GetHeader("email"), c.Param("list"))
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	if listupdate.Name != "" {
		dblist.Name = listupdate.Name
	}
	dblist.List = listupdate.List
	dblist.Shop = listupdate.Shop
	err = database.UpdateList(c.GetHeader("email"), dblist)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, gin.H{"message": "List updated successfully"})
}

func listdelete(c *gin.Context) {
	err := database.DeleteList(c.GetHeader("email"), c.Param("list"))
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, gin.H{"message": "List deleted successfully"})
}

func lists(c *gin.Context) {
	dblists, err := database.GetUserLists(c.GetHeader("email"))
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, dblists)
}

func newList(c *gin.Context) {
	var newlist newListRequest
	if err := c.ShouldBindJSON(&newlist); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	var dblist database.List
	dblist.Name = newlist.Name
	dblist.List = newlist.List
	dblist.Shop = newlist.Shop
	dblist.Status = false
	dblist.Date = "01-01-1990"
	userEmail := c.GetHeader("email")
	err := database.AddList(userEmail, dblist)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, gin.H{"message": "List created successfully"})
}

func ApplyListsRoutes(r *gin.Engine) {
	r.GET("/lists", AuthMiddleware(), lists)
	r.POST("/lists/newlist", AuthMiddleware(), newList)
	r.GET("/lists/:list", AuthMiddleware(), listget)
	r.POST("/lists/:list", AuthMiddleware(), listpost)
	r.DELETE("/lists/:list", AuthMiddleware(), listdelete)
}
