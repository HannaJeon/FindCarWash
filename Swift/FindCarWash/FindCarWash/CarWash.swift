//
//  Location.swift
//  FindCarWash
//
//  Created by HannaJeon on 2017. 7. 30..
//  Copyright © 2017년 HannaJeon. All rights reserved.
//

import Foundation

class CarWash {
//    static let sharedInstance = CarWash()
    
    private(set) var id: Int!
    private(set) var 시군구명: String!
    private(set) var 사업장업종명: String!
    private(set) var 휴무일: String?
    private(set) var 세차요금정보: String?
    private(set) var 평일운영시작시각: String?
    private(set) var 평일운영종료시각: String?
    private(set) var 휴일운영시작시각: String?
    private(set) var 휴일운영종료시각: String?
    private(set) var 대표자명: String?
    private(set) var 세차유형: String?
    private(set) var 데이터기준일자: String!
    private(set) var 사업장명: String!
    private(set) var 소재지도로명주소: String!
    private(set) var 시도명: String!
    private(set) var 세차장전화번호: String?
    private(set) var 위도: Double!
    private(set) var 경도: Double!
    private(set) var 수질허가번호: String!
    
//    init() {}
    
    init(carWash: [String:Any]) {
        self.id = carWash["_id"] as! Int
        self.시군구명 = carWash["시군구명"] as! String
        self.사업장업종명 = carWash["사업장업종명"] as! String
        self.휴무일 = carWash["휴무일"] as? String
        self.세차요금정보 = carWash["세차요금정보"] as? String
        self.평일운영시작시각 = carWash["평일운영시작시각"] as? String
        self.평일운영종료시각 = carWash["평일운영종료시각"] as? String
        self.휴일운영시작시각 = carWash["휴일운영시작시각"] as? String
        self.휴일운영종료시각 = carWash["휴일운영종료시각"] as? String
        self.대표자명 = carWash["대표자명"] as? String
        self.세차유형 = carWash["세차유형"] as? String
        self.데이터기준일자 = carWash["데이터기준일자"] as! String
        self.사업장명 = carWash["사업장명"] as! String
        self.소재지도로명주소 = carWash["소재지도로명주소"] as! String
        self.시도명 = carWash["시도명"] as! String
        self.세차장전화번호 = carWash["세차장전화번호"] as? String
        self.위도 = carWash["위도"] as! Double
        self.경도 = carWash["경도"] as! Double
        self.수질허가번호 = carWash["수질허가번호"] as! String
    }
    
}
