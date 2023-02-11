package database

type User struct {
	Email        string
	PasswordHash string
	NbLists      int
}

type Product struct {
	Frequency int
	Product   string
}

type List struct {
	Name   string `json:"name" binding:"required"`
	List   string `json:"list" binding:"required"`
	Shop   string `json:"shop" binding:"required"`
	Status bool   `json:"status" binding:"required"`
	Date   string `json:"date" binding:"required"`
}
