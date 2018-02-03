package controllers

import (
	"fmt"
	"log"

	"github.com/astaxie/beego"
)

const (
	MSG_OK            = 200
	MSG_ERR_Param     = 400
	MSG_ERR_Verified  = 401
	MSG_ERR_Authority = 403
	MSG_ERR_Resources = 404
	MSG_ERR           = 500
)

type BaseController struct {
	beego.Controller
}

//ajax返回
func (this *BaseController) ajaxMsg(msg interface{}, msgno int) {
	out := make(map[string]interface{})
	out["status"] = msgno
	out["message"] = msg
	this.Data["json"] = out
	this.ServeJSON()
	this.StopRun()
}

//ajax返回 列表
func (this *BaseController) ajaxList(msg interface{}, msgno int, count int64, data interface{}) {
	out := make(map[string]interface{})
	out["code"] = msgno
	out["message"] = msg
	out["count"] = count
	out["data"] = data
	this.Data["json"] = out
	this.ServeJSON()
	this.StopRun()
}

// 通过两重循环过滤重复元素
func (this *BaseController) RemoveRepBySlice(slc []string) []string {
	result := []string{} // 存放结果
	for i := range slc {
		flag := true
		for j := range result {
			if slc[i] == result[j] {
				flag = false // 存在重复元素，标识为false
				break
			}
		}
		if flag { // 标识为false，不添加进结果
			result = append(result, slc[i])
		}
	}
	return result
}

// 图片接口
func (this *BaseController) PutFileImg() {
	h, err := this.GetFiles("file")
	fmt.Println("文件名称", h[0].Filename)
	fmt.Println("文件大小", h[0].Size)
	if err != nil {
		log.Fatal("getfile err ", err)
	}
	//	defer f.Close()
	path := "static/upload/" + h[0].Filename
	this.SaveToFile("file", path) // 保存位置在 static/upload, 没有文件夹要先创建
	list := make(map[string]interface{})
	list["src"] = path
	list["name"] = h[0].Filename
	list["size"] = h[0].Size
	this.ajaxList("图片上传成功", MSG_OK, 1, list)
}
