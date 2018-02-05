package controllers

import (
	"MenuPj/models"
	"encoding/json"
	"fmt"

	"time"

	_ "github.com/Go-SQL-Driver/MySQL"
	"github.com/alecthomas/log4go"
	"github.com/astaxie/beego/orm"
)

type DishController struct {
	BaseController
}

func (this *DishController) Get() {
	this.TplName = "addDish.tpl"
}

func (this *DishController) Add_Show() {
	this.TplName = "addDish.tpl"
}

func (this *DishController) Add_Action() {
	fmt.Println("点击新增按钮")
	//定义
	o := orm.NewOrm()
	//dish:=new(models.Dish)
	list := make(map[string]interface{})

	var dish_info models.Dish
	json.Unmarshal(this.Ctx.Input.RequestBody, &dish_info)
	fmt.Println("dish_info:", &dish_info)
	if dish_info.Time == "" {
		dish_info.Time = time.Now().Format("2006-01-02 15:04:05")
	}

	num, err := o.Insert(&dish_info)
	if err != nil {
		log4go.Stdout("新增菜品失败", err.Error())
		this.ajaxMsg("新增失败", MSG_ERR_Resources)
	}
	fmt.Println("num", num)
	list["id"] = num
	this.ajaxList("新增成功", MSG_OK, 1, list)
	return

}
