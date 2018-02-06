package routers

import (
	"MenuPj/controllers"

	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &controllers.MainController{})
	//get img
	beego.Router("/v1/put_img", &controllers.BaseController{}, "*:PutFileImg")
	//home
	beego.Router("/v1/home", &controllers.HomeController{})
	beego.Router("/v1/getdata", &controllers.HomeController{}, "*:GetData")
	beego.Router("/v1/deldata", &controllers.HomeController{}, "*:DelData")
	//dish
	beego.Router("/v1/dish/add_show", &controllers.DishController{}, "*:Add_Show")
	beego.Router("/v1/dish/add_action", &controllers.DishController{}, "*:Add_Action")
	beego.Router("/v1/dish/edit_show", &controllers.DishController{}, "*:Edit_Show")
	beego.Router("/v1/dish/edit_action", &controllers.DishController{}, "*:Edit_Action")
	beego.Router("/v1/dish/edit_show", &controllers.DishController{}, "*:Edit_Show")
	beego.Router("/v1/dish/show", &controllers.DishController{}, "*:Show")
}
