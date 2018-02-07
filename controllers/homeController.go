package controllers

import (
	"MenuPj/models"
	"fmt"
	"strconv"
	"strings"

	_ "github.com/Go-SQL-Driver/MySQL"
	"github.com/alecthomas/log4go"
	"github.com/astaxie/beego/orm"
)

type HomeController struct {
	BaseController
}

func (this *HomeController) Get() {
	this.TplName = "home.tpl"
}

func (this *HomeController) GetData() {
	fmt.Println("获取菜品数据")
	o := orm.NewOrm()
	var maps []orm.Params
	dish := new(models.Dish)
	query := o.QueryTable(dish)
	//list := make(map[string]interface{})

	filters := make([]interface{}, 0)
	status := this.Input().Get("status")
	if status != "" {
		if status == "0" {
			filters = append(filters, "Stocks__gt", 0)
			filters = append(filters, "Status", status)
		} else if status == "1" {
			ins := []int{1, 2}
			filters = append(filters, "Status__in", ins)
		} else if status == "2" {
			//库存为0的
			filters = append(filters, "Stocks", 0)
		}
	}
	fmt.Println("get dish status:", status)
	name := this.Input().Get("name")
	if name != "" {
		filters = append(filters, "Name", name)
	}
	fmt.Println("get dish name:", name)
	sell_price := this.Input().Get("sell_price")
	if sell_price != "" {
		filters = append(filters, "Sell_price", sell_price)
	}
	fmt.Println("get dish sell_price:", sell_price)
	if len(filters) > 0 {
		l := len(filters)
		for k := 0; k < l; k += 2 {
			query = query.Filter(filters[k].(string), filters[k+1])
		}
	}
	num, err := query.Values(&maps)
	if err != nil {
		log4go.Stdout("获取菜品失败", err.Error())
		this.ajaxMsg("获取菜品失败", MSG_ERR_Resources)
	}
	fmt.Println("get dish reslut num:", num)
	//list["data"] = maps
	this.ajaxList("获取菜品成功", 0, num, maps)
	return

}

func (this *HomeController) DelData() {
	fmt.Println("删除菜品数据")
	o := orm.NewOrm()
	dish := new(models.Dish)
	//list := make(map[string]interface{})
	id, err := this.GetInt("id")
	if err != nil {
		log4go.Stdout("获取菜品id失败", err.Error())
		this.ajaxMsg("获取菜品id失败", MSG_ERR_Param)
	}
	fmt.Println("del id:", id)
	num, err := o.QueryTable(dish).Filter("Id", id).Delete()
	if err != nil {
		log4go.Stdout("删除菜品失败", err.Error())
		this.ajaxMsg("删除菜品失败", MSG_ERR_Resources)
	}
	fmt.Println("del dish reslut num:", num)
	//list["data"] = maps
	this.ajaxMsg("删除菜品成功", MSG_OK)
	return

}

//批量删除
func (this *HomeController) DelMultiData() {
	fmt.Println("删除菜品数据")
	o := orm.NewOrm()
	dish := new(models.Dish)
	//list := make(map[string]interface{})
	id := this.Input().Get("id")
	fmt.Println("del id:", id)
	idList := strings.Split(id, ",")
	fmt.Println("idList:", idList)
	id_len := len(idList) - 1
	var idIntList []int64
	for i := 0; i < id_len; i++ {
		idd, err := strconv.ParseInt(idList[i], 10, 64)
		if err != nil {
			log4go.Stdout("delmulti string转int 失败", err.Error())
		}
		idIntList = append(idIntList, idd)
	}
	fmt.Println("idIntList:", idIntList)
	num, err := o.QueryTable(dish).Filter("Id__in", idIntList).Delete()
	if err != nil {
		log4go.Stdout("删除菜品失败", err.Error())
		this.ajaxMsg("删除菜品失败", MSG_ERR_Resources)
	}
	fmt.Println("del multidish reslut num:", num)
	if num == 0 {
		this.ajaxMsg("删除菜品失败", MSG_ERR_Param)
	}
	//list["data"] = maps
	this.ajaxMsg("删除菜品成功", MSG_OK)
	return
}

//批量上架
func (this *HomeController) MultiOnShelves() {
	fmt.Println("删除菜品数据")
	o := orm.NewOrm()
	dish := new(models.Dish)
	//list := make(map[string]interface{})
	id := this.Input().Get("id")
	fmt.Println("del id:", id)
	idList := strings.Split(id, ",")
	fmt.Println("idList:", idList)
	id_len := len(idList) - 1
	var idIntList []int64
	for i := 0; i < id_len; i++ {
		idd, err := strconv.ParseInt(idList[i], 10, 64)
		if err != nil {
			log4go.Stdout("delmulti string转int 失败", err.Error())
		}
		idIntList = append(idIntList, idd)
	}
	fmt.Println("idIntList:", idIntList)
	num, err := o.QueryTable(dish).Filter("Id__in", idIntList).Delete()
	if err != nil {
		log4go.Stdout("删除菜品失败", err.Error())
		this.ajaxMsg("删除菜品失败", MSG_ERR_Resources)
	}
	fmt.Println("del multidish reslut num:", num)
	if num == 0 {
		this.ajaxMsg("删除菜品失败", MSG_ERR_Param)
	}
	//list["data"] = maps
	this.ajaxMsg("删除菜品成功", MSG_OK)
	return
}

//批量下架
func (this *HomeController) MultiOffShelves() {
	fmt.Println("删除菜品数据")
	o := orm.NewOrm()
	dish := new(models.Dish)
	//list := make(map[string]interface{})
	id := this.Input().Get("id")
	fmt.Println("del id:", id)
	idList := strings.Split(id, ",")
	fmt.Println("idList:", idList)
	id_len := len(idList) - 1
	var idIntList []int64
	for i := 0; i < id_len; i++ {
		idd, err := strconv.ParseInt(idList[i], 10, 64)
		if err != nil {
			log4go.Stdout("delmulti string转int 失败", err.Error())
		}
		idIntList = append(idIntList, idd)
	}
	fmt.Println("idIntList:", idIntList)
	num, err := o.QueryTable(dish).Filter("Id__in", idIntList).Delete()
	if err != nil {
		log4go.Stdout("删除菜品失败", err.Error())
		this.ajaxMsg("删除菜品失败", MSG_ERR_Resources)
	}
	fmt.Println("del multidish reslut num:", num)
	if num == 0 {
		this.ajaxMsg("删除菜品失败", MSG_ERR_Param)
	}
	//list["data"] = maps
	this.ajaxMsg("删除菜品成功", MSG_OK)
	return
}
