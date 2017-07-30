var express = require('express')
var router = express.Router()
var request = require('request')
var CarWash = require('../model/carWash')

router.get('/', function(req, res) {
  var url = "http://api.data.go.kr/openapi/carwsh-std"
  var queryParams = "?" + encodeURIComponent("serviceKey") + "=IUQxXYt84s9SpNhlvb0b0M6ID%2BqQavU%2F%2Bm83m66QGe%2BW2AXMFMSnA%2BX7BLa%2F%2BctudoIlCxDnjiL51m7VBT2Tww%3D%3D"
  queryParams += "&" + encodeURIComponent("s_list") + "=" + encodeURIComponent("17000")
  queryParams += "&" + encodeURIComponent("type") + "=" + encodeURIComponent("json")

  request({
    url: url + queryParams,
    method: "GET"
  }, function(err, res, body) {

    var data = JSON.parse(body)
    for(var i = 0; i < data.length; i++) {
      var carWash = new CarWash(data[i])
      carWash.location = [data[i].경도, data[i].위도]
      carWash.save()
    }
  })
  res.json("success")
})

module.exports = router
