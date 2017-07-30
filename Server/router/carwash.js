var express = require('express')
var router = express.Router()
var CarWash = require('../model/carWash')

router.post('/', function(req, res) {
  CarWash.find({
    location: {
      $near: {
        $geometry: {
          type: "Point",
          coordinates: [req.body.longitude, req.body.latitude]
        },
        $maxDistance: 1000
      }
    }
  }).exec(function(err, carwash) {
    res.json(carwash)
  })
})

module.exports = router
