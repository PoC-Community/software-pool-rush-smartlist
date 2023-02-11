package database

func DeleteDB() {
	DataBase.Exec("DROP DATABASE IF EXISTS smartlist;")
}
