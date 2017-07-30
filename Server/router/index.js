var express = require('express')
var router = express.Router()
var api = require('./api')
var carwash = require('./carwash')

router.use('/admin/api', api)
router.use('/carwash', carwash)

module.exports = router
