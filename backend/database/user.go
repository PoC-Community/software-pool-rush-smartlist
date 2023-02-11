package database

import (
	"errors"
)

var errorNoEmail = errors.New("No email provided")
var errorNoPassword = errors.New("No password provided")
var errorUserNotFound = errors.New("User not found")

func StoreUserInDB(user User) error {
	if user.Email == "" {
		return errorNoEmail
	}
	if user.Email == "" {
		return errorNoPassword
	}
	DataBase.Exec("INSERT INTO Users (email, password_hash, nblists) VALUES (?, ?);", user.Email, user.PasswordHash, user.NbLists)
	return nil
}

func GetUserFromDB(email string) (User, error) {
	var user User
	if email == "" {
		return user, errorNoEmail
	}
	DataBase.Raw("SELECT email, password_hash, nblists FROM Users WHERE email LIKE ?;", email).Scan(&user)
	if user.Email == "" || user.PasswordHash == "" {
		return user, errorUserNotFound
	}
	return user, nil
}

func getUserID(email string) (int, error) {
	var userid int
	DataBase.Raw("SELECT id FROM Users WHERE email LIKE ?;", email).Scan(&userid)
	if userid == 0 {
		return userid, errorUserNotFound
	}
	return userid, nil
}

func getUserNbLists(email string) (int, error) {
	var nblists int
	DataBase.Raw("SELECT nblists FROM Users WHERE email LIKE ?;", email).Scan(&nblists)
	if nblists == 0 {
		return nblists, errorUserNotFound
	}
	return nblists, nil
}
