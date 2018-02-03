package models

type Dish struct {
	Id             int64
	Name           string `orm:"index"`
	Classify       string
	Pic_path       string
	Original_price float64
	Sell_price     float64 `orm:"index"`
	Stocks         int64
	Unit           string
	Info           string
	Status         int
	Time           string
}
