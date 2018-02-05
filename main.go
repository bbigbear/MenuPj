package main

import (
	_ "MenuPj/routers"
	"fmt"

	"MenuPj/models"

	_ "github.com/Go-SQL-Driver/MySQL"
	"github.com/alecthomas/log4go"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
)

func init() {
	DBConnection()
	RegisterModel()
	//初始化日志
	log4go.LoadConfiguration("log4go.xml")
	log4go.Info("log4go init ok")
}

func main() {
	orm.Debug = true
	orm.RunSyncdb("default", false, true)
	beego.Run()
}
func DBConnection() {
	fmt.Println("初始化数据库")
	orm.RegisterDriver("mysql", orm.DRMySQL)
	orm.RegisterDataBase("default", "mysql", "root:qwe!23@/menu?charset=utf8")
}

func RegisterModel() {
	fmt.Println("注册数据库模型")
	orm.RegisterModel(new(models.Dish))

}
