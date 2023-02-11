package database

import "errors"

var errorNoShop = errors.New("No shop provided")
var errorNoName = errors.New("No list name provided")

func AddList(email string, newlist List) error {
	if email == "" {
		return errorNoEmail
	}
	userid, err := getUserID(email)
	if err != nil {
		return err
	}
	if newlist.Name == "" {

	}
	DataBase.Exec("INSERT INTO Lists (name, list, shop, status, date, fk_owner) VALUES (?, ?, ?, ?, ?, ?)", newlist.Name, newlist.List, newlist.Shop, newlist.Status, newlist.Date, userid)
	return nil
}

func GetUserLists(email string) ([]List, error) {
	var lists []List
	if email == "" {
		return lists, errorNoEmail
	}
	DataBase.Raw("SELECT name, list, shop, status, date FROM Lists INNER JOIN Users ON Lists.fk_owner = Users.id WHERE Users.email LIKE ?", email).Scan(&lists)
	return lists, nil
}

func GetUserListsByShop(email, shop string) ([]List, error) {
	var lists []List
	if email == "" {
		return lists, errorNoEmail
	}
	if shop == "" {
		return lists, errorNoShop
	}
	DataBase.Raw("SELECT name, list, shop, status, date FROM Lists INNER JOIN Users ON Lists.fk_owner = Users.id WHERE Users.email LIKE ? AND Lists.shop LIKE ?", email, shop).Scan(&lists)
	return lists, nil
}

func GetUserList(email, name string) (List, error) {
	var list List
	if email == "" {
		return list, errorNoEmail
	}
	if name == "" {
		return list, errorNoName
	}
	DataBase.Raw("SELECT name, list, shop, status, date FROM Lists INNER JOIN Users ON Lists.fk_owner = Users.id WHERE Users.email LIKE ? AND Lists.name LIKE ?", email, name).Scan(&list)
	return list, nil
}

func UpdateList(email string, list List) error {
	if email == "" {
		return errorNoEmail
	}
	userid, err := getUserID(email)
	if err != nil {
		return err
	}
	DataBase.Exec("UPDATE Lists SET name = ?, list = ?, shop = ?, status = ?, date = ? WHERE name LIKE ? AND fk_owner = ?", list.Name, list.List, list.Shop, list.Status, list.Date, list.Name, userid)
	return nil
}
