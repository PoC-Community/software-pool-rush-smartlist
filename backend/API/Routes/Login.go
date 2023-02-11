package Routes

import (
	"Rush/database"
	"github.com/dgrijalva/jwt-go"
	"github.com/gin-gonic/gin"
	"golang.org/x/crypto/bcrypt"
	"net/http"
	"os"
	"time"
)

type loginRequest struct {
	Email    string `json:"email" binding:"required"`
	Password string `json:"password" binding:"required"`
}

func generateToken(username string) (string, error) {
	nowTime := time.Now()
	expireTime := nowTime.Add(3 * time.Hour)

	claims := Claims{
		username,
		jwt.StandardClaims{
			ExpiresAt: expireTime.Unix(),
			Issuer:    "gin-jwt",
		},
	}

	tokenClaims := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	token, err := tokenClaims.SignedString([]byte(os.Getenv("JWT_SECRET")))

	return token, err
}

func ParseToken(token string) (*Claims, error) {
	tokenClaims, err := jwt.ParseWithClaims(token, &Claims{}, func(token *jwt.Token) (interface{}, error) {
		return os.Getenv("JWT_SECRET"), nil
	})

	if tokenClaims != nil {
		if claims, ok := tokenClaims.Claims.(*Claims); ok && tokenClaims.Valid {
			return claims, nil
		}
	}

	return nil, err
}

func Login(c *gin.Context) {
	var user loginRequest
	if err := c.ShouldBindJSON(&user); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	// Retrieve the user information from the database
	dbUser, err := database.GetUserFromDB(user.Email)
	if err != nil {
		c.JSON(http.StatusUnauthorized,
			gin.H{"error": "Username or password is incorrect db"})
		return
	}

	// Compare the hashed password with the one entered by the user
	if err := bcrypt.CompareHashAndPassword([]byte(dbUser.PasswordHash),
		[]byte(user.Password)); err != nil {
		c.JSON(http.StatusUnauthorized,
			gin.H{"error": "Username or password is incorrect hash"})
		return
	}

	// Generate a JWT token for the user
	token, err := generateToken(dbUser.Email)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to generate token"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"token": token})
}

func ApplyLoginRoutes(r *gin.Engine) {
	r.POST("/login", Login)
}
