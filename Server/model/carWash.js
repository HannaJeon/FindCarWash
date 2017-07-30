var mongoose = require('mongoose')
var Schema = mongoose.Schema

var carWashSchema = new Schema({
  _id: false,
  시군구명: String,
  사업장업종명: String,
  휴무일: String,
  세차요금정보: String,
  평일운영시작시각: String,
  휴일운영시작시각: String,
  대표자명: String,
  평일운영종료시각: String,
  세차유형: String,
  데이터기준일자: String,
  사업장명: String,
  소재지도로명주소: String,
  시도명: String,
  세차장전화번호: String,
  id: Number,
  경도: Number,
  위도: Number,
  수질허가번호: String,
  휴일운영종료시각: String,
  location: {
    index: '2dsphere',
    type: [Number]
  }
})

module.exports = mongoose.model('CarWash', carWashSchema)
