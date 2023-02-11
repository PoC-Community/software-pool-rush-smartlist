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
	Name   string
	List   string
	Shop   string
	Status bool
	Date   string
}
