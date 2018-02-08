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
	this.TplName = "home.tpl"
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
	var order_info models.OrderTime
	json.Unmarshal(this.Ctx.Input.RequestBody, &dish_info)
	fmt.Println("dish_info:", &dish_info)
	if dish_info.Time == "" && dish_info.Status == 0 {
		dish_info.Time = time.Now().Format("2006-01-02 15:04:05")
	}

	num, err := o.Insert(&dish_info)
	if err != nil {
		log4go.Stdout("新增菜品失败", err.Error())
		this.ajaxMsg("新增失败", MSG_ERR_Resources)
	}
	fmt.Println("自增Id(num)", num)
	//插入时间数据库
	if dish_info.Status == 1 {
		order_info.Secs = this.GetSecs(dish_info.Time)
		order_info.Did = num
		num, err := o.Insert(&order_info)
		if err != nil {
			log4go.Stdout("插入预约时间失败", err.Error())
			this.ajaxMsg("插入预约时间失败", MSG_ERR_Resources)
		}
		fmt.Println("自增order_Id(num)", num)
	}
	list["id"] = num
	this.ajaxList("新增成功", MSG_OK, 1, list)
	return

}

func (this *DishController) Edit_Show() {
	fmt.Println("点击菜品编辑")
	o := orm.NewOrm()
	var maps []orm.Params
	dish := new(models.Dish)

	id := this.Input().Get("id")
	fmt.Println("id:", id)

	num, err := o.QueryTable(dish).Filter("Id", id).Values(&maps)
	if err != nil {
		log4go.Stdout("编辑菜品失败", err.Error())
		this.ajaxMsg("编辑失败", MSG_ERR_Resources)
	}
	fmt.Println("edit dish reslut num:", num)
	this.Data["dish_info"] = maps
	for _, m := range maps {
		this.Data["id"] = m["Id"]
		this.Data["c"] = m["Classify"]
		this.Data["u"] = m["Unit"]
		this.Data["i"] = m["Info"]
		this.Data["s"] = m["Status"]
		this.Data["p"] = m["Pic_path"]
	}
	this.TplName = "editDish.tpl"
	return
}

func (this *DishController) Edit_Action() {
	this.TplName = "addDish.tpl"
	fmt.Println("更新菜品编辑")
	o := orm.NewOrm()
	var dish_info models.Dish
	json.Unmarshal(this.Ctx.Input.RequestBody, &dish_info)
	fmt.Println("dish_info:", &dish_info)
	num, err := o.Update(&dish_info)
	fmt.Println("updata dish reslut num:", num)
	if err != nil {
		log4go.Stdout("更新菜品失败", err.Error())
		this.ajaxMsg("更新失败", MSG_ERR_Resources)
	}
	if num == 0 {
		this.ajaxMsg("更新失败", MSG_ERR_Param)
	}
	this.ajaxMsg("修改成功", MSG_OK)
	return
}

func (this *DishController) Show() {
	fmt.Println("点击菜品编辑")
	o := orm.NewOrm()
	var maps []orm.Params
	dish := new(models.Dish)

	id := this.Input().Get("id")
	fmt.Println("id:", id)

	num, err := o.QueryTable(dish).Filter("Id", id).Values(&maps)
	if err != nil {
		log4go.Stdout("编辑菜品失败", err.Error())
		this.ajaxMsg("编辑失败", MSG_ERR_Resources)
	}
	fmt.Println("edit dish reslut num:", num)
	this.Data["dish_info"] = maps
	for _, m := range maps {
		this.Data["c"] = m["Classify"]
		this.Data["u"] = m["Unit"]
		this.Data["i"] = m["Info"]
		this.Data["s"] = m["Status"]
		this.Data["p"] = m["Pic_path"]
	}
	this.TplName = "showDish.tpl"
	return

}
