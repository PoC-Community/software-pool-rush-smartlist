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
		nblists, err := getUserNbLists(email)
		if err != nil {
			return err
		}
		newlist.Name = "List " + string(nblists)
	}
	DataBase.Exec("INSERT INTO Lists (name, list, shop, status, date, fk_owner) VALUES (?, ?, ?, ?, ?, ?)", newlist.Name, newlist.List, newlist.Shop, newlist.Status, newlist.Date, userid)
	DataBase.Exec("UPDATE Users SET nblists = nblists + 1 WHERE id = ?;", userid)
	return nil
}

func GetUserLists(email string) ([]List, error) {
	var lists []List
	if email == "" {
		return lists, errorNoEmail
	}
	DataBase.Raw("SELECT name, list, shop, status, date FROM Lists INNER JOIN Users ON Lists.fk_owner = Users.id WHERE Users.email LIKE ? ORDER BY Lists.id DESC", email).Scan(&lists)
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
	DataBase.Raw("SELECT name, list, shop, status, date FROM Lists INNER JOIN Users ON Lists.fk_owner = Users.id WHERE Users.email LIKE ? AND Lists.shop LIKE ? ORDER BY Lists.id DESC", email, shop).Scan(&lists)
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

func DeleteList(email, name string) error {
	if email == "" {
		return errorNoEmail
	}
	if name == "" {
		return errorNoName
	}
	userid, err := getUserID(email)
	if err != nil {
		return err
	}
	DataBase.Exec("DELETE FROM Lists WHERE name LIKE ? AND fk_owner = ?", name, userid)
	return nil
}

func SearchUserList(email, name string) (List, error) {
	var list List
	if email == "" {
		return list, errorNoEmail
	}
	if name == "" {
		return list, errorNoName
	}
	DataBase.Raw("SELECT name, list, shop, status, date FROM Lists INNER JOIN Users ON Lists.fk_owner = Users.id WHERE Users.email LIKE ? AND Lists.name LIKE ?", email, name+"%").Scan(&list)
	return list, nil
}

func GetUserShops(email string) ([]string, error) {
	var shops []string
	if email == "" {
		return shops, errorNoEmail
	}
	DataBase.Raw("SELECT shop, count(shop) FROM Lists INNER JOIN Users ON Lists.fk_owner = Users.id WHERE Users.email LIKE ? GROUP BY shop", email).Scan(&shops)
	return shops, nil
}
