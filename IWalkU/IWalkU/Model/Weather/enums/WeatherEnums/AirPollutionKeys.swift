//
//  AirPollutionKeys.swift
//  IWalkU
//
//  Created by hw on 28/09/2019.
//  Copyright © 2019 DandD. All rights reserved.
//

import Foundation

struct AirPollutionKeys{
    static let grade = "GRADE"            //통합대기환경지수 등급
    static let totalQuality = "통합대기환경지수"  //통합대기환경지수
    static let pollutant = "주 오염원"    //지수 결정 물질
    static let nitrogen = "이산화질소"  //이산화질소(단위:ppm)
    static let ozone = "오존"    //오존(단위:ppm)
    static let carbon = "일산화탄소"  //일산화탄소(단위:ppm)
    static let sulfurous = "아황산가스"    // 아황산가스(단위:ppm)
    static let pm10 = "미세먼지"  //미세먼지(단위:㎍/㎥)
    static let pm25 = "초미세먼지"  //초미세먼지(단위:㎍/㎥)
    
    static func addUnits( key: String, value: String) -> String{
        switch key {
        case nitrogen,ozone,carbon,sulfurous:
            return "\(value) ppm"
        case pm10, pm25:
            return "\(value) ㎍/㎥"
        default:
            return "\(value)"
        }
    }

}
