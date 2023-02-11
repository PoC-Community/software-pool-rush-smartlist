package Routes

import (
	"Rush/database"
	"github.com/gin-gonic/gin"
	"golang.org/x/crypto/bcrypt"
	"net/http"
)

type registerRequest struct {
	Email    string `json:"email" binding:"required"`
	Password string `json:"password" binding:"required"`
}

func Register(c *gin.Context) {
	var user registerRequest
	if err := c.ShouldBindJSON(&user); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	// Hash the password before storing it in the database
	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(user.Password),
		bcrypt.DefaultCost)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to hash password"})
		return
	}
	var DBUser database.User
	DBUser.PasswordHash = string(hashedPassword)
	DBUser.Email = user.Email
	DBUser.NbLists = 0

	// Store the user information in the database
	if err := database.StoreUserInDB(DBUser); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to store user in database"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "User registered successfully"})
}

func ApplyRegisterRoutes(r *gin.Engine) {
	r.POST("/register", Register)
}
