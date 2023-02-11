package database

import (
	"fmt"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/postgres"
)

var DataBase *gorm.DB

func InitDatabase() *gorm.DB {
	db, err := gorm.Open("postgres", "user=postgres password=password dbname=smartlist sslmode=disable")
	if err != nil {
		panic(fmt.Sprintf("unable to open PostgreSQL database :", err))
	}
	db.Exec("DROP TABLE IF EXISTS Products;")
	db.Exec("DROP TABLE IF EXISTS Lists;")
	db.Exec("DROP TABLE IF EXISTS Users;")
	db.Exec("CREATE TABLE Users (id serial not null constraint users_pkey primary key, email text, password_hash varchar(73), nblists int);")
	db.Exec("CREATE TABLE Products (id serial not null constraint products_pkey primary key, product text, frequency bigint, fk_user integer not null constraint products_user_fkey references Users);")
	db.Exec("CREATE TABLE Lists (id serial not null constraint lists_pkey primary key, name text not null, list text, shop text NULL, status boolean, date date, fk_owner integer not null constraint list_owner_fkey references Users);")
	DataBase = db
	return db
}
