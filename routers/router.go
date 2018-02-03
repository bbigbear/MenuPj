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
	//dish
	beego.Router("/v1/dish/add_show", &controllers.DishController{}, "*:Add_Show")
	beego.Router("/v1/dish/add_action", &controllers.DishController{}, "*:Add_Action")
}
