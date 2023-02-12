package database

import (
	"fmt"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/postgres"
	"os"
)

var DataBase *gorm.DB

func InitDatabase() *gorm.DB {
	passwd := os.Getenv("DB_PASS")
	usr := os.Getenv("DB_USER")
	host := os.Getenv("DB_HOST")
	dbname := os.Getenv("DB_NAME")
	port := os.Getenv("DB_PORT")
	db, err := gorm.Open("postgres", fmt.Sprintf("user=%s password=%s dbname=%s host=%s port=%s sslmode=disable", usr, passwd, dbname, host, port))
	if err != nil {
		panic(fmt.Sprintf("unable to open PostgreSQL database :", err))
	}
	db.Exec("DROP TABLE IF EXISTS Products;")
	db.Exec("DROP TABLE IF EXISTS Lists;")
	db.Exec("DROP TABLE IF EXISTS Users;")
	db.Exec("CREATE TABLE Users (id serial not null constraint users_pkey primary key, email text, password_hash text, nblists int);")
	db.Exec("CREATE TABLE Products (id serial not null constraint products_pkey primary key, product text, frequency bigint, fk_user integer not null constraint products_user_fkey references Users);")
	db.Exec("CREATE TABLE Lists (id serial not null constraint lists_pkey primary key, name text not null, list text, shop text NULL, status boolean, date date, fk_owner integer not null constraint list_owner_fkey references Users);")
	DataBase = db
	return db
}
