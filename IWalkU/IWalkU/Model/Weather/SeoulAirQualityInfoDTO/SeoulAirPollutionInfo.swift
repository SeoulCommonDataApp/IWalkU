//
//  AirPolutionInfo.swift
//  _weather_api_test
//
//  Created by hw on 25/09/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation
//

// MARK: - AirPollutionInfo
struct SeoulAirPollutionInfo: Codable {
    let listAvgOfSeoulAirQualityService: ListAvgOfSeoulAirQualityService?
    enum CodingKeys: String, CodingKey {
        case listAvgOfSeoulAirQualityService = "ListAvgOfSeoulAirQualityService"
    }
}

// MARK: - ListAvgOfSeoulAirQualityService
struct ListAvgOfSeoulAirQualityService: Codable {
    let listTotalCount: Int?
    let result: Result?
    let row: [Row]?

    enum CodingKeys: String, CodingKey {
        case listTotalCount = "list_total_count"
        case result = "RESULT"
        case row
    }
}

// MARK: - Result
struct Result: Codable {
    let code, message: String?

    enum CodingKeys: String, CodingKey {
        case code = "CODE"
        case message = "MESSAGE"
    }
}

// MARK: - Row
struct Row: Codable {
    let grade, totalQuality, pollutant: String?
    let nitrogen, ozone, carbon, sulfurous: Double?
    let pm10, pm25: Int?

    enum CodingKeys: String, CodingKey {
        case grade = "GRADE"            //통합대기환경지수 등급
        case totalQuality = "IDEX_MVL"  //통합대기환경지수
        case pollutant = "POLLUTANT"    //지수 결정 물질
        case nitrogen = "NITROGEN"  //이산화질소(단위:ppm)
        case ozone = "OZONE"    //오존(단위:ppm)
        case carbon = "CARBON"  //일산화탄소(단위:ppm)
        case sulfurous = "SULFUROUS"    // 아황산가스(단위:ppm)
        case pm10 = "PM10"  //미세먼지(단위:㎍/㎥)
        case pm25 = "PM25"  //초미세먼지(단위:㎍/㎥)
    }
}

