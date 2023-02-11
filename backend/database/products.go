package database

import "errors"

var errorNoProduct = errors.New("No product provided")

func AddProduct(email string, product Product) error {
	if email == "" {
		return errorNoEmail
	}
	if product.Product == "" {
		return errorNoProduct
	}
	userid, err := getUserID(email)
	if err != nil {
		return err
	}
	DataBase.Exec("INSERT INTO Products (product, frequency, fk_owner) VALUES (?, ?, ?);", product.Product, product.Frequency, userid)
	return nil
}

func GetFavoriteProducts(email string) ([]Product, error) {
	var products []Product
	if email == "" {
		return products, errorNoEmail
	}
	DataBase.Raw("SELECT product, frequency FROM Products INNER JOIN Users ON Products.fk_owner = Users.id WHERE Users.email LIKE ? ORDER BY frequency DESC;", email).Scan(&products)
	return products, nil
}
