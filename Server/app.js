var express = require('express');
var app = express()
var bodyParser = require('body-parser')
var router = require('./router/index')
var mongoose = require('mongoose');

mongoose.connect('mongodb://localhost:27017/FindCarWash', {
  useMongoClient: true
})
mongoose.Promise = global.Promise

app.listen(3000, function() {
  console.log("start 3000port!")
})

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended: true}))
app.use('/api/v1', router)
