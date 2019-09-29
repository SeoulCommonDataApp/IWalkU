//
//  AirQualityRowData.swift
//  IWalkU
//
//  Created by hw on 28/09/2019.
//  Copyright © 2019 DandD. All rights reserved.
//

import Foundation

// MARK: - AirQualityRowData
struct AirQualityRowData: Codable {
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
    
    func convertPropertiesToKeyValueList() -> [(key: String, value: Any)] {
        var dictionary = [String: Any]()
        if let grade = grade, let totalQuality = totalQuality, let pollutant = pollutant {
            dictionary.updateValue(grade, forKey: AirPollutionKeys.grade)
            dictionary.updateValue(totalQuality, forKey: AirPollutionKeys.totalQuality)
            dictionary.updateValue(pollutant, forKey: AirPollutionKeys.pollutant)
        }
        if let nitrogen = nitrogen, let ozone = ozone, let carbon = carbon, let sulfurous = sulfurous{
            dictionary.updateValue(nitrogen, forKey: AirPollutionKeys.nitrogen)
            dictionary.updateValue(ozone, forKey: AirPollutionKeys.ozone)
            dictionary.updateValue(carbon, forKey: AirPollutionKeys.carbon)
            dictionary.updateValue(sulfurous, forKey: AirPollutionKeys.sulfurous)
        }
        if let pm10 = pm10, let pm25 = pm25 {
            dictionary.updateValue(pm10, forKey: AirPollutionKeys.pm10)
            dictionary.updateValue(pm25, forKey: AirPollutionKeys.pm25)
        }
        let result = dictionary.sorted { (lhs:(key: String, value: Any), rhs: (key: String, value: Any)) -> Bool in
            return lhs.key < rhs.key
        }
        return result
    }
}
