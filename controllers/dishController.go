package controllers

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
	this.TplName = "addDish.tpl"
}
