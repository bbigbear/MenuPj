package models

type Dish struct {
	Id             int64
	name           string
	classify       string
	pic_path       string
	original_price float64
	sell_price     float64
	stocks         int64
	unit           string
	info           string
	status         int
	time           string
}
